class Concern::ControllerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../../templates", __FILE__)

  def create_concerns
    setting_path = "controllers/concerns"
    template "concern.erb", File.join("app", setting_path, class_path, "#{file_name}.rb")
    template "controller_spec.erb", File.join("spec", setting_path, class_path, "#{file_name}_spec.rb")
  end
end
