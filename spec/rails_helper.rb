# frozen_string_literal: true

require 'spec_helper'
require 'faker'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'shoulda/matchers'
require 'simplecov'
require 'pundit/rspec'
require 'dotenv'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each(&method(:require))

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

