# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kilometer-ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "kilometer-ruby"
  spec.version       = Kilometer::VERSION
  spec.authors       = ["Yuri Kroz"]
  spec.email         = ["yuri@kilometer.io"]
  spec.summary       = "The official Kilometer.io Ruby library."
  spec.description   = "This is the official Kilometer.io Ruby library. This library allows for server-side integration of Kilometer."
  spec.homepage      = "http://kilometer.io"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", "~> 1.12.a"
  spec.add_development_dependency "rake", "~> 10.0"
end
