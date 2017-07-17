$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "barite/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "barite"
  s.version     = Barite::VERSION
  s.authors     = ["weathare"]
  s.email       = ["fuzuki.close@gmail.com"]
  s.homepage    = "https://github.com/weathare/barite"
  s.summary     = "RailsRails API patters generator."
  s.description = "RailsRails API patters generator."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "active_model_serializers"
  s.add_dependency "attr_extras"
  s.add_dependency "rails", ">= 5.1.2"
  s.add_dependency "rambulance"
  s.add_development_dependency "ammeter"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-highlight"
end
