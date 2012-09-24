# encoding: utf-8

require 'bundler/setup'

lib = File.expand_path('../../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'enpoop'

RSpec.configure do |config|
  # Some (optional) config here
end