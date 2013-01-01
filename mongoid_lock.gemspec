# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid/lock/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_lock"
  s.version     = Mongoid::Lock::VERSION
  s.authors     = ["Meredith Lesly"]
  s.email       = ["meredith@xoala.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MongoidLock."
  s.description = "TODO: Description of MongoidLock."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files    = Dir.glob('spec/**/*')
  s.require_paths = ['lib']

  s.add_dependency "mongoid", ["~> 3.0"]
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard-rspec'
end
