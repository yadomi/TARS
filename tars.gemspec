# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tars/version'

Gem::Specification.new do |spec|
  spec.name          = "tars"
  spec.version       = TARS::VERSION
  spec.authors       = ["Felix Yadomi"]
  spec.email         = ["felix.yadomi@gmail.com"]

  spec.summary       = %q{Telegram Bot API Wrapper with webhook support}
  spec.homepage      = "http://github.com/yadomi/TARS"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json", "~> 1.8"
  spec.add_dependency "httparty", "~> 0.13.5"
  spec.add_dependency "rest-client", "~> 1.8.0"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
