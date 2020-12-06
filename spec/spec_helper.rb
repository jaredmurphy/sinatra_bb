# frozen_string_literal: true

ENV["RACK_ENV"] ||= "test"

require File.expand_path("../config/environment", __dir__)

require "capybara/dsl"
require "capybara/rspec"
require "database_cleaner"
require "factory_bot"
require "faker"
require "rspec"
require "shoulda-matchers"

Capybara.app = BrassBull
DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:all) do
    DatabaseCleaner.clean
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end
