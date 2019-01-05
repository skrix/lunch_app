source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# =============== CORE =====================
gem 'rails',       '~> 5.2.0'
gem 'pg',          '>= 0.18', '< 2.0'
gem 'puma',        '~> 3.11'
gem 'bootsnap',    '>= 1.1.0', require: false

# ============= FRONTEND ===================
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'hamlit'
gem 'hamlit-rails'
gem 'devise-bootstrap-views'
gem 'simple_form'
gem 'cocoon'
gem 'jquery-rails'
gem 'bootstrap-datepicker-rails'
gem 'jbuilder', '~> 2.5'


# ============= FEATURES ===================
gem 'devise'
gem 'rolify'
gem 'pundit'
gem 'draper'
gem 'seed_migration'

# ================ API =====================
gem 'fast_jsonapi'
gem 'simple_token_authentication', '~> 1.0'

# ============= DEV & TEST =================
group :development, :test do
  gem 'bullet'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'rspec-rails', '~> 3.7'
  gem 'dotenv-rails'
  gem 'faker',       git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'pry',         platforms: %i[mri mingw x64_mingw]
end

# ================ DEV =====================
group :development do
  gem 'awesome_print'
  gem 'web-console',           '>= 3.3.0'
  gem 'listen',                '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# ================ TEST ====================
group :test do
  gem 'factory_bot_rails'
  gem 'coveralls',             require: false
  gem 'timecop'
  gem 'shoulda-matchers',      '~> 3.1'
  gem 'database_cleaner'
  gem 'capybara',              '>= 2.15', '< 4.0'
  gem 'capybara-selenium'
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data'
