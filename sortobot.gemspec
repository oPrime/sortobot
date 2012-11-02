# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sortobot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mohan"]
  gem.email         = ["mohanr2222@gmail.com"]
  gem.description   = %q{A CLI tool for organizing files in a directory}
  gem.summary       = %q{A CLI tool for really messed up directories like your home folder or Downloads}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = ["sortobot"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sortobot"
  gem.require_paths = ["lib"]
  gem.version       = Sortobot::VERSION

  gem.add_dependency 'thor'
end
