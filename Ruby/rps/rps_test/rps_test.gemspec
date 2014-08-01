# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rps_test/version'

Gem::Specification.new do |spec|
  spec.name          = "rps_test"
  spec.version       = RpsTest::VERSION
  spec.authors       = ["mntj"]
  spec.email         = ["mntj11@gmail.com"]
  spec.summary       = %q{Tests for RPS}
  spec.description   = %q{Just some tests for private use}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
