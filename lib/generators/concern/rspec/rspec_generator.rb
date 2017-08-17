require "active_support/inflector"

class Concern::RspecGenerator < Rails::Generators::NamedBase
  class_option(
    :controller,
    type: :string,
    aliases: "-c",
  )

  class_option(
    :model,
    type: :string,
    aliases: "-m",
  )

  source_root(File.expand_path("../../templates", __FILE__))

  def generate_spec
    return unless options[:controller] || options[:model]

    template("base_#{_type}_spec.erb", spec_filepath) if invoke? && !File.exists?(spec_filepath)
  end

  def copy_shared_spec
    copy_file("include_module_example.rb", "spec/support/include_module_example.rb") if invoke?
  end

  def include_spec
    # [xxx] - destroy の時に不要なコードが挿入されてしまう
    inject_into_file spec_filepath, content, after: /^RSpec.describe (.+) do\n/
  end

  private
    def invoke?
      self.behavior == :invoke
    end

    def _type
      (!!options[:controller]) ? :controller : :model
    end

    def target_name
      options[_type].classify
    end

    def spec_filepath
      {
        controller: "_controller_spec.rb",
        model: "_spec.rb",
      }.map do |type, postfix|
        File.join(*%W[spec #{type}s #{options[type]}#{postfix}]) if !!options&.[](type)
      end.compact.pop
    end

    def content
      <<-'CODE'
  describe "Included module" do
    subject { [class_name] }

    include_examples "included modules"
  end
      CODE
        .gsub(/class_name/, class_name)
    end
end
