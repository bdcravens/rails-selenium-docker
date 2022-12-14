require 'capybara/cucumber'
# require 'capybara'
require 'selenium-webdriver'
require 'pry'

Capybara.register_driver :remote_chrome do |app|
  Capybara::Selenium::Driver.new(app,
  browser: :remote,
  capabilities: Selenium::WebDriver::Remote::Capabilities.chrome,
  url: "http://selenium:4444/wd/hub")
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :remote_chrome
  config.javascript_driver = :remote
  config.app_host = 'http://www.google.com' # change this to point to your application
end
