# frozen_string_literal: true

require 'rails/generators/test_unit'
require 'rails/generators/resource_helpers'

module IntegrationTestUnit
  class ScaffoldGenerator < Rails::Generators::NamedBase # :nodoc:
    include Rails::Generators::ResourceHelpers

    source_root File.expand_path('templates', __dir__)

    class_option :api, type: :boolean,
                       desc: 'Generate API functional tests'

    class_option :system_tests, type: :string,
                                desc: "Generate system test files (set to 'true' to enable)"

    argument :attributes, type: :array, default: [], banner: 'field:type field:type'

    def create_test_files
      template_file = options.api? ? 'api_functional_test.rb' : 'functional_test.rb'
      template template_file,
               File.join('test/integration', controller_class_path, "#{controller_file_name}_test.rb")

      # Generate system tests if this isn't an API only app and the system
      # tests option is true
      return unless !options.api? && options[:system_tests] == 'true'

      template 'system_test.rb', File.join('test/system', class_path, "#{file_name.pluralize}_test.rb")
    end

    def fixture_name
      @fixture_name ||=
        if mountable_engine?
          (namespace_dirs + [table_name]).join('_')
        else
          table_name
        end
    end

    private

    def attributes_string
      if attributes_hash.empty?
        '{}'
      else
        "{ #{attributes_hash.map { |k, v| "#{k}: #{v}" }.join(', ')} }"
      end
    end

    def attributes_hash
      return {} if attributes_names.empty?

      attributes_names.filter_map do |name|
        if %w[password password_confirmation].include?(name) && attributes.any?(&:password_digest?)
          ["#{name}", '"secret"']
        elsif !virtual?(name)
          ["#{name}", "@#{singular_table_name}.#{name}"]
        end
      end.sort.to_h
    end

    def boolean?(name)
      attribute = attributes.find { |attr| attr.name == name }
      attribute&.type == :boolean
    end

    def virtual?(name)
      attribute = attributes.find { |attr| attr.name == name }
      attribute&.virtual?
    end

    def datetime?(name)
      attribute = attributes.find { |attr| attr.name == name }
      attribute&.type == :datetime
    end

    def time?(name)
      attribute = attributes.find { |attr| attr.name == name }
      attribute&.type == :time
    end
  end
end
