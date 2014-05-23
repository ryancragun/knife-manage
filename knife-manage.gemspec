# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife-manage/version'

Gem::Specification.new do |spec|
  spec.name          = "knife-manage"
  spec.version       = Knife::Manage::VERSION
  spec.authors       = ["Ryan Cragun"]
  spec.email         = ["me@ryan.ec"]
  spec.summary       = %q{Manage multiple knife configuration files}
  spec.description   = spec.summary
  spec.homepage      = "http://github/ryancragun/knife-manage"
  spec.license       = "MIT"

  spec.files = %w(LICENSE.txt README.md Rakefile) + Dir.glob("{lib,spec}/**/*")
 # spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'chef'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
