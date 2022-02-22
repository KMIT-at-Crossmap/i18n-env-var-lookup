# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'i18n-env-var-lookup/version'

Gem::Specification.new do |s|
  s.name          = "i18n-env-var-lookup"
  s.version       = I18n::EnvVarLookup::VERSION
  s.authors       = ["Stayman Hou"]
  s.email         = ["stayman.hou@gmail.com"]
  s.homepage      = "https://github.com/StaymanHou/i18n-env-var-lookup"
  s.summary       = "Provides a backend to the i18n gem to allow translation definitions to reference environment variables"
  s.description   = "Provides a backend to the i18n gem to allow a definition to contain embedded references to environment variables by introducing the special embedded notation ~{}. E.g. {title: ~{APP_NAME}} will evaluate t(:title) to the value of the $APP_NAME environment variable."

  s.files         = `git ls-files app lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.rubyforge_project = '[none]'

  s.add_dependency 'i18n'
  s.add_dependency 'activesupport'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'test_declarative'
  s.add_development_dependency 'test-unit'
end
