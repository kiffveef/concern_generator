require "rambulance"

class Rambulance::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path("../../templates", __FILE__)

  def copy_rambulance
    copy_file("initializers.rb", "config/initializers/rambulance.rb")
    copy_file("handler.rb", "app/handlers/exceptions_app.rb")
    copy_file("handler_spec.rb", "spec/handlers/exceptions_app_spec.rb")
  end
end
