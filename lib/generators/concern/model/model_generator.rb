class Concern::ModelGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../../templates", __FILE__)

  def create_concerns
    setting_path = "models/concerns"
    template "concern.erb", File.join("app", setting_path, class_path, "#{file_name}.rb")
    template "model_spec.erb", File.join("spec", setting_path, class_path, "#{file_name}_spec.rb")
  end

  def copy_rspec_helper
    copy_file("mock_table_helper.rb", "spec/support/mock_table_helper.rb") if invoke?
  end

  def inject_code
    rspec_helper = Rails.root.join(*%w[spec rails_helper.rb])
    inject_into_file rspec_helper, before: /^ActiveRecord::Migration\.maintain_test_schema!/ do <<-'CODE'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

    CODE
    end if injectable?(rspec_helper)
  end

  private
    def invoke?
      self.behavior == :invoke
    end

    def injectable?(file_path)
      if invoke?
        !(File.read(file_path) =~ /^Dir.+spec\/support\/.+\.rb.+require f/)
      end
    end
end
