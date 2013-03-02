#!/usr/bin/env gem build
# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$:.unshift lib unless $:.include? lib

require 'enpoop/version'

Gem::Specification.new do |spec|
  spec.name          = 'enpoop'
  spec.summary       = '“Encoding + Poop = Enpoop”'
  spec.authors       = 'Maik Kempe'
  spec.email         = 'dev@nrolla.com'
  spec.homepage      = 'https://github.com/mkempe/enpoop'
  spec.version       = Enpoop::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.date          = '2013-03-02'
  spec.licenses      = 'MIT'

  spec.require_paths = ['lib']

  spec.files = %w[
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

  spec.executables = ['enpoop']

  spec.test_files = spec.files.grep(%r{^(features|spec|test)/})

  # spec.files       = `git ls-files`.split($/)
  # spec.executables = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  # spec.test_files  = spec.files.grep(%r{^(features|spec|test)/})

  spec.add_runtime_dependency 'thor', '~> 0.17.0'

  spec.add_development_dependency 'bundler', '~> 1.3.0'

  spec.add_development_dependency 'rake',    '~> 10.0.3'

  spec.add_development_dependency 'rspec',   '~> 2.13.0'

  spec.required_rubygems_version = Gem::Requirement.new '>= 1.3.6'
end