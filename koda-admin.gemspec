# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler/version'

Gem::Specification.new do |s|
  s.name        = "koda-admin"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcel du Prez", "Derek Ekins"]
  s.email       = ["marceldupr@gmail.com", "derek@spathi.com"]
  s.homepage    = "https://github.com/KodaFramework"
  s.summary     = "Koda Auth - admin for Koda"
  s.description = "Koda Auth - admin for Koda"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency 'sinatra'


  s.add_development_dependency 'rspec', '>= 2.8'
  s.add_development_dependency 'rack-test'

  s.files        = Dir.glob("{lib}/**/*")
  #s.executables  = ['bundle']
  s.require_path = 'lib'
end