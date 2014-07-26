# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pluggable_lite/version'

Gem::Specification.new do |spec|
  spec.name          = "pluggable_lite"
  spec.version       = PluggableLite::VERSION
  spec.authors       = ["nyamage"]
  spec.email         = ["nyamage@server.fake"]
  spec.summary       = %q{PluggableLite is a module to help you to create pluggable architecture}
  spec.description   = %q{PluggableLite is a module to help you to create pluggable architecture. it's easy to use and since pluggablelite itself is very small, you can understand how it works easily}
  spec.homepage      = "https://github.com/nyamage/PluggableLite"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
