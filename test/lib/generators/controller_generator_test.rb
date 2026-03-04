# frozen_string_literal: true

require 'test_helper'
require 'rails/generators/rails/controller/controller_generator'

class ControllerGeneratorTest < Rails::Generators::TestCase
  tests Rails::Generators::ControllerGenerator
  destination Rails.root
  arguments %w[Stuff]

  setup :prepare_destination
  setup :run_generator

  test 'creates an integration test' do
    assert_file 'test/integration/stuff_test.rb', /StuffTest/
  end

  test 'does not create a controller test' do
    assert_no_file 'test/controllers/stuff_controller_test.rb'
  end
end
