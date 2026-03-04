# rails-integration-test-generator

rails-integration-test generator overrides the controller generator to generate an integration test rather than the default controller test, which is really just a mislabeled integration test anyway.

## Usage

Just add this to your gemfile:

```ruby
gem 'rails-integration-test-generator'
```

Evertyime a controller is generated, an integration test will automatically be generated along with it.

## Rationale

Naming integration tests as controller tests is confusing and obscures their actual purpose, which is to test if various parts of an application integrate successfully.
