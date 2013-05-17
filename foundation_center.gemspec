# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foundation_center'

Gem::Specification.new do |spec|
  spec.name          = "foundation_center"
  spec.version       = FoundationCenter::VERSION
  spec.authors       = ["Dan Porter"]
  spec.email         = ["wolfpakz@gmail.com"]
  spec.description   = %q{A Ruby interface to the Foundation Center grant recipients API}
  spec.summary       = %q{Provides a simple interface for fetching information about grant recipients and the grants they've received.}
  spec.homepage      = "http://github.com/wolfpakz/foundation-center"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.6.7"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.0.4"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency "shoulda-matchers", "~> 2.1.0"
end
