# frozen_string_literal: true

require "selenium/webdriver"

default_max_wait_time = 3
default_width         = 1280
default_height        = 720
selenium_flags        = %W[
  --headless
  --disable-gpu
  --window-size=#{default_width},#{default_height}
]

options = Selenium::WebDriver::Chrome::Options.new
selenium_flags.each { |flag| options.add_argument(flag) }

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_max_wait_time = default_max_wait_time
  config.default_driver        = :headless_chrome
  config.javascript_driver     = :headless_chrome
end
