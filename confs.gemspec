# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'confs/version'

Gem::Specification.new do |spec|
  spec.name          = "confs"
  spec.version       = Confs::VERSION
  spec.authors       = ["divins", "Dor3nz"]
  spec.email         = ["divins@codegram.com", "genis@codegram.com"]
  spec.description   = %q{Fetch Codegram Conferences data to be used in the specific websites.}
  spec.summary       = %q{Fetch Codegram Conferences data.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "hyperclient", "0.4.0"
end
