# frozen_string_literal: true

require 'capybara/dsl'
require 'selenium-webdriver'
require './setup.rb'

class Crawler
  include Capybara::DSL
  def initialize
    @sites = File.read('sites.txt').split
  end

  def scan_site
    p 'Scanning'
    @sites.each do |url|
      p 'Logo-placement test'
      visit url
      sleep 1
      input_logo(url)
      sleep 1
      p 'Autofill test'
      auto_fill
    end
  end

  def input_logo(url)
    hostname = URI.parse(url).host
    if page.has_selector?('div.subhq-subs-icon')
      p 'PASS: tilig logo succesfuly loaded on: ' + hostname
    else
      p 'FAIL: no tilig logo found on ' + hostname
      system("echo #{page.body} >>  html/#{hostname}.html")
    end
  end

  def auto_fill
    p page.has_text?('mikey@tilig.com')
  end
end

crawler = Crawler.new

crawler.scan_site
