# frozen_string_literal: true

require 'test_helper'
require 'rails/generators/rails/scaffold/scaffold_generator'

class ScaffoldGeneratorTest < Rails::Generators::TestCase
  tests Rails::Generators::ScaffoldGenerator
  destination Rails.root
  arguments %w[Stuff]

  setup do
    prepare_destination
    system 'mkdir tmp/rails/config'
    system 'touch tmp/rails/config/routes.rb'
    run_generator
  end

  test 'creates an integration test' do
    assert_file 'test/integration/stuffs_test.rb', /StuffsTest/
  end

  test 'does not create a controller test' do
    assert_no_file 'test/controllers/'
  end
end
