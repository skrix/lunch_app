# frozen_string_literal: true

LIB = 'lib'

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module LunchApp
  class Application < Rails::Application
    config.load_defaults 5.2
    config.autoload_paths << Rails.root.join(LIB)
  end
end
