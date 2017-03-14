# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitodo/version'

Gem::Specification.new do |spec|
  spec.name          = 'gitodo'
  spec.version       = Gitodo::VERSION
  spec.authors       = ['Noah Callaway']
  spec.email         = ['noah@apsis.io']

  spec.summary       = %q{Track developer todo items in git (per branch)}
  spec.homepage      = 'http://www.apsis.io'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'slayer',  '~> 0.3.1'
  spec.add_development_dependency 'bundler',  '~> 1.14'
  spec.add_development_dependency 'rake',     '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters', '~> 1.1'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'simplecov', '~> 0.13'
  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'rubocop', '~> 0.47.1'
end
