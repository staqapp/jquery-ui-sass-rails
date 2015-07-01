# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jquery/ui/sass/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "staqapp-jquery-ui-sass-rails"
  spec.version       = Jquery::Ui::Sass::Rails::VERSION
  spec.authors       = ["Brian Kemper"]
  spec.email         = ["Brian@Staq.com"]
  spec.summary       = "jQuery UI packaged for the Rails asset pipeline with SASS"
  spec.description   = ""
  spec.homepage      = "https://github.com/staqapp/jquery-ui-sass-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f = /^jquery-ui-rails/ }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jquery-ui-rails", "~> 5.0.5"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
