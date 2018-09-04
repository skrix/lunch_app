source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Dotenv
  gem 'dotenv-rails'
  # In BDD we trust
  # FactoryBot
  gem 'factory_bot_rails'
  # Faker
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  # RSpec
  gem 'rspec-rails', '~> 3.7'
  # Call 'pry' anywhere in the code to stop execution and get a debugger console
  gem 'pry', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'awesome_print'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'timecop'
  # Shoulda matchers
  gem 'shoulda-matchers', '~> 3.1'
  # Adds support for Capybara system testing and selenium driver
  # In BDD we trust
  # Database cleaner
  gem 'database_cleaner'
  # Capybara
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'capybara-selenium'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Rubocop
gem 'rubocop'
gem 'rubocop-rspec'

# Devise for auth
gem 'devise'

# Hamlit
gem 'hamlit'
gem 'hamlit-rails'

# Bootstrap
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'

# Test coverage percentage Coveralls
gem 'coveralls', require: false

# For user custom roles permissions
# Rolify
gem 'rolify'
# Pundit
gem 'pundit'

# SimpleForm gem for forms rendering
gem 'simple_form'
# Cocoon
gem 'cocoon'
gem 'jquery-rails'
# Drapper decorators
gem 'draper'
# Datepicker
gem 'bootstrap-datepicker-rails'
# API
gem 'fast_jsonapi'
