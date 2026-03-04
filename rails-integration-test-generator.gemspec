# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'rails-integration-test-generator'
  s.version = '0.1.0'
  s.summary = 'Generates integration test instead of controller tests'
  s.description = 'Overrides rails controller generator to generate an integration test instead of a controller test'
  s.author = 'Patrick McSweeny'
  s.email = 'patmcsweeny@gmail.com'
  s.files = Dir['{lib}/**/*', 'README.md', 'LICENSE']
  s.required_ruby_version = '>= 3.0.0'
  s.license = 'MIT'

  s.add_runtime_dependency 'railties', '>= 7.0'

  s.add_development_dependency 'rails'
  s.add_development_dependency 'rake'
end
