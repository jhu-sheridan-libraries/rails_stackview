$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_stackview/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_stackview"
  s.version     = RailsStackview::VERSION
  s.authors     = ["Amanda Cornwell"]
  s.email       = ["amanda.cornwell@jhu.edu"]
  s.homepage    = "https://github.com/jhu-sheridan-libraries/rails_stackview"
  s.summary     = "Test"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 6.1"
  s.add_dependency "jquery-rails" # stackview needs jquery
  s.add_dependency "sass-rails" # we do use scss, leaving version string off to let rails app do it hopefully
end
