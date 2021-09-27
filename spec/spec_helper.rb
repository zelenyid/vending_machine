# frozen_string_literal: true

require_relative '../config/autoloader'
require_relative 'support/creator_helper'

ENV['APP_ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.include CreatorHelper

  config.after do
    Database.instance.db.execute(
      'DELETE FROM products'
    )
    Database.instance.db.execute(
      'DELETE FROM vending_machine_money'
    )
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
