# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geo_position/version'

Gem::Specification.new do |gem|
  gem.name          = "geo_position"
  gem.version       = GeoPosition::VERSION
  gem.authors       = ["Nate Klaiber"]
  gem.email         = ["nate@theklaibers.com"]
  gem.description   = %q{ A gem that handles conversion between Decimal/Hours/Seconds and Latitude/Longitude }
  gem.summary       = %q{ Converting between Deciman/Hours/Seconds and Latitude/Longitude }
  gem.homepage      = "http://archivability.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'redcarpet'
end
