# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'super/tailer/version'

Gem::Specification.new do |spec|
  spec.name          = "super-tailer"
  spec.version       = Super::Tailer::VERSION
  spec.authors       = ["andrerocker"]
  spec.email         = ["andre.souza@gmail.com"]

  spec.summary       = 'Pure ruby simple log tailer'
  spec.description   = 'A pure ruby simple log tailer gem'
  spec.homepage      = 'https://github.com/andrerocker/super-tailer'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
