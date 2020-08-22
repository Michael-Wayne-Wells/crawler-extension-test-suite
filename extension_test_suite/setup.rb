# frozen_string_literal: true

puts 'RUNNING!'

require 'capybara/dsl'
require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new

options.add_extension(
  'dist.crx'
)
Capybara.register_driver :crawler_driver do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, url: ENV['SELENIUM_REMOTE_URL'], options: options)
end
Capybara.default_driver = :crawler_driver



