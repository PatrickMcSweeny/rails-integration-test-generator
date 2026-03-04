# frozen_string_literal: true

require 'rubygems'
require 'minitest/autorun'
require 'rails'
require 'rails/generators'
require 'rails/generators/test_case'
require 'rails-integration-test-generator'

class TestApp < Rails::Application
end
Rails.application = TestApp

Rails.application.config.root = File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp', 'rails'))

Rails::Generators.configure! Rails.application.config.generators
