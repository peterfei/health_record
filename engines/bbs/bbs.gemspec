$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bbs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bbs"
  s.version     = Bbs::VERSION
  s.authors     = ["peterfei"]
  s.email       = ["peterfeispace@gmail.com"]
  s.homepage    = "http://peterfei.github.io"
  s.summary     = "bbs"
  s.description = "Bbs."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "sqlite3"
end
