# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'switchy/version'

Gem::Specification.new do |spec|
  spec.name          = "switchy"
  spec.version       = Switchy::VERSION
  spec.authors       = ["Tyler Ewing"]
  spec.email         = ["tewing10@gmail.com"]
  spec.summary       = %q{Switch git remote urls}
  spec.description   = %q{Simple gem to switch git remote urls between https and ssh}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
