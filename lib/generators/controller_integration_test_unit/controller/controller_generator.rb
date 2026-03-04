# frozen_string_literal: true

module ControllerIntegrationTestUnit
  class ControllerGenerator < Rails::Generators::NamedBase # :nodoc:
    source_root File.expand_path('templates', __dir__)

    argument :actions, type: :array, default: [], banner: 'action action'
    class_option :skip_routes, type: :boolean

    def create_test_files
      template 'functional_test.rb',
               File.join('test/integration', class_path, "#{file_name}_test.rb")
    end
  end
end
