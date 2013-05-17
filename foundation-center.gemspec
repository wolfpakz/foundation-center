# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foundation/center/version'

Gem::Specification.new do |spec|
  spec.name          = "foundation-center"
  spec.version       = Foundation::Center::VERSION
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

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
