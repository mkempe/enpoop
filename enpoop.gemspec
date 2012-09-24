#!/usr/bin/env gem build
# encoding: utf-8

$:.push File.expand_path('../lib', __FILE__)

require 'enpoop/version'

Gem::Specification.new do |s|
  s.name          = 'enpoop'
  s.summary       = '“Encoding + Poop = Enpoop”'
  s.description   = '“Encoding + Poop = Enpoop”'
  s.authors       = ['Maik Kempe']
  s.email         = ['dev@nrolla.com']
  s.homepage      = 'https://github.com/mkempe/enpoop'
  s.version       = Enpoop::VERSION
  s.date          = '2012-09-24'
  s.licenses      = ['MIT']

  s.executables   = ['enpoop']

  s.require_paths = ['lib']

  s.files = %w[
    bin/enpoop
    lib/enpoop/ui/shell.rb
    lib/enpoop/cli.rb
    lib/enpoop/version.rb
    lib/enpoop.rb
    COPYING
    Gemfile
    Rakefile
    README.md
  ]

  s.test_files = s.files.grep(%r{^(features|spec|test)/})

  s.add_runtime_dependency 'thor', '~> 0.16.0'

  s.add_development_dependency 'rake',  '~> 0.9.2'
  s.add_development_dependency 'rspec', '~> 2.11.0'

  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
end