# frozen_string_literal: true

require 'capybara/dsl'
require 'selenium-webdriver'
require './spec/feature_helper.rb'

class Login
  include Capybara::DSL
  def initialize
    @extension = 'http://tilig-api:3000'
  end

  def login
    puts 'Logging into Tilig!'
    # visit @url
    visit @extension

    sleep 1

    click_on 'Sign in with Google'
  end
end

crawler = Login.new
crawler.login
