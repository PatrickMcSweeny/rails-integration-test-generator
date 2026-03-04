# frozen_string_literal: true

require 'rake/testtask'
require 'rails'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
end

task default: :test
