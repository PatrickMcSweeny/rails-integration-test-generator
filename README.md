# rails-integration-test-generator [![Gem Version](https://badge.fury.io/rb/rails-integration-test-generator.svg)](https://badge.fury.io/rb/rails-integration-test-generator) [![Build Status](https://github.com/patrickmcsweeny/rails-integration-test-generator/actions/workflows/main.yml/badge.svg)](https://github.com/PatrickMcSweeny/rails-integration-test-generator/actions/workflows/main.yml)


rails-integration-test generator overrides the controller generator to generate an integration test rather than the default controller test, which is really just a mislabeled integration test anyway.

## Usage

Just add this to your gemfile:

```ruby
gem "rails-integration-test-generator"
```

This gem has been tested with Rails versions 7.0-8.1

Evertyime a controller is generated, an integration test will automatically be generated along with it.

For example, running the following command:

```
rails generate controller Things
```

will result in a things_test.rb file being generated in the test/integration folder with the following contents:

```
require "test_helper"

class ThingsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end

```

Generating a controller with action names like this

```
rails generate controller Things action1 action2
```

will result in a file with the following contents:

```
require "test_helper"

class ThingsTest < ActionDispatch::IntegrationTest
  test "successfully load action1" do
    get things_action1_url
    assert_response :success
  end

  test "successfully load action2" do
    get things_action2_url
    assert_response :success
  end
end

```

## Rationale

Naming integration tests as controller tests is confusing and obscures their actual purpose, which is to test if various parts of an application integrate successfully.
