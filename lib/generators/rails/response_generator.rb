require "active_model_serializers"
require "generators/rails/serializer_generator"

class Rails::ResponseGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  def create_serializer_file
    if invoke?
      generate :serializer, name
    else
      ::Rails::Command.invoke :destroy, ["serializer", name]
    end
  end

  def create_response_file
    template "serializer_spec.erb", File.join("spec/serializers", class_path, "#{file_name}_serializer_spec.rb")
    copy_file("active_model_serializers_helper.rb", "spec/support/active_model_serializers_helper.rb") if invoke?
  end

  private
    def invoke?
      self.behavior == :invoke
    end
end
