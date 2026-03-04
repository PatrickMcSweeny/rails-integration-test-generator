# frozen_string_literal: true

require 'rails'

module RailsIntegrationTestGenerator
  module Rails
    class Railtie < ::Rails::Railtie # :nodoc:
      config.app_generators do |g|
        g.test_framework :controller_integration_test_unit, fixture: false
        g.fallbacks[:controller_integration_test_unit] = :test_unit
      end
    end
  end
end
