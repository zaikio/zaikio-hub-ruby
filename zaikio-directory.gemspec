$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "zaikio/directory/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "zaikio-directory"
  spec.version     = Zaikio::Directory::VERSION
  spec.authors     = ["Zaikio GmbH"]
  spec.email       = ["js@crispymtn.com"]
  spec.homepage    = "https://www.zaikio.com/"
  spec.summary     = "Ruby API Client for Zaikio's Directory"
  spec.description = "Ruby API Client for Zaikio's Directory"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "jwt", "~> 2.2.1"
  spec.add_dependency "multi_json", "~> 1.14.1"
  spec.add_dependency "oj", "~> 3.10.5"
  spec.add_dependency "spyke", "~> 5.3.4"
end
