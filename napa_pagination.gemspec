# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'napa_pagination/version'

Gem::Specification.new do |spec|
  spec.name          = "napa_pagination"
  spec.version       = NapaPagination::VERSION
  spec.authors       = ["Darby Frey"]
  spec.email         = ["darby@bellycard.com"]
  spec.summary       = %q{A simple pagination representer for Napa}
  spec.description   = %q{A simple pagination representer for Napa}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'grape'
  spec.add_dependency 'napa'
  spec.add_dependency 'kaminari'
  spec.add_dependency 'activerecord'
  
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', "~> 3.0"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'kaminari'
  spec.add_development_dependency 'actionview'
end
