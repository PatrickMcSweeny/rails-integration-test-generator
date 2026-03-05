# rails-integration-test-generator [![Gem Version](https://badge.fury.io/rb/rails-integration-test-generator.svg)](https://badge.fury.io/rb/rails-integration-test-generator) [![Build Status](https://github.com/patrickmcsweeny/rails-integration-test-generator/actions/workflows/main.yml/badge.svg)](https://github.com/PatrickMcSweeny/rails-integration-test-generator/actions/workflows/main.yml)


rails-integration-test generator overrides the controller generator to generate an integration test rather than the default controller test, which is really just a mislabeled integration test anyway.

## Usage

Just add this to your gemfile:

```ruby
gem 'rails-integration-test-generator'
```

This gem has been tested with Rails versions 7.0-8.1

Evertyime a controller is generated, an integration test will automatically be generated along with it.

## Rationale

Naming integration tests as controller tests is confusing and obscures their actual purpose, which is to test if various parts of an application integrate successfully.
