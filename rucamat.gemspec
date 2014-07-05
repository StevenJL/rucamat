# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rucamat/version'

Gem::Specification.new do |spec|
  spec.name          = "rucamat"
  spec.version       = Rucamat::VERSION
  spec.authors       = ["Steven Li"]
  spec.email         = ["stevenjli@gmail.com"]
  spec.summary       = %q{Ruby code class, modules, and methods analysis command line tool}
  spec.description   = %q{Command Line Tool to catalog and analyze classes, modules, and methods in your Ruby project.}
  spec.homepage      = "https://github.com/StevenJL/rucamat"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
