require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'capybara/dsl'
require 'rspec'
require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new

# options.add_argument('--headless')
# extension fails if ran headless
options.add_argument('--disable-gpu')
options.add_argument('--window-size=1280,800')
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--disable-setuid-sandbox')
options.add_argument('--no-sandbox')

options.add_extension(
  './dist.crx'
)
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, url: ENV['SELENIUM_REMOTE_URL'], options: options)
end
Capybara.default_driver = :selenium
Capybara.save_path = './tmp/capybara'
