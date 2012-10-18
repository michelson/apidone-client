# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apidone-client/version'

Gem::Specification.new do |gem|
  gem.name          = "apidone-client"
  gem.version       = Apidone::Client::VERSION
  gem.authors       = ["Miguel Michelson"]
  gem.email         = ["miguelmichelson@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency("thor")
  gem.add_runtime_dependency("faraday")
  gem.add_runtime_dependency("json")
  
  gem.add_development_dependency(%q<bundler>)
  gem.add_development_dependency(%q<rspec>,           ["~> 2.6.0"])
  
  
  
end
