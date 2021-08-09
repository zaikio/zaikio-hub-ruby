$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "zaikio/hub/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "zaikio-hub"
  spec.version     = Zaikio::Hub::VERSION
  spec.authors     = ["crispymtn", "Jalyna Schröder", "Martin Spickermann"]
  spec.email       = ["op@crispymtn.com", "js@crispymtn.com", "spickermann@gmail.com"]
  spec.homepage    = "https://www.zaikio.com/"
  spec.summary     = "Ruby API Client for Zaikio's Hub"
  spec.description = "Ruby API Client for Zaikio's Hub"
  spec.license     = "MIT"
  spec.metadata["changelog_uri"] = "https://github.com/zaikio/zaikio-hub-ruby/blob/master/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md",
                   "CHANGELOG.md"]

  spec.required_ruby_version = ">= 2.6.5"

  spec.add_dependency "concurrent-ruby"
  spec.add_dependency "jwt", "~> 2.2.1"
  spec.add_dependency "multi_json", ">= 1.14.1", "< 1.16.0"
  spec.add_dependency "oj", ">= 3.10.5", "< 3.14.0"
  spec.add_dependency "spyke", ">= 5.3.4", "< 6.1.0"
  spec.add_dependency "zaikio-client-helpers", "~> 0.2"
end
