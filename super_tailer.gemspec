# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'super_tailer/version'

Gem::Specification.new do |spec|
  spec.name          = "super_tailer"
  spec.version       = SuperTailer::VERSION
  spec.authors       = ["andrerocker"]
  spec.email         = ["andre.souza@gmail.com"]

  spec.summary       = 'Pure ruby simple log tailer'
  spec.description   = 'A pure ruby simple log tailer gem'
  spec.homepage      = 'https://github.com/andrerocker/super_tailer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'timers'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
