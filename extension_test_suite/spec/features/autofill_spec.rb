require 'feature_helper'
@sites = File.read('sites_login.txt').split
@sites.each do |url|
  RSpec.feature "#{url} - Extension script" do
    before(:each) do
      visit 'http://tilig-api:3000'
      click_on 'Sign in with Google'
      visit url
    end

    scenario 'autofills username' do
      sleep 1
      expect(page).to have_selector("input[value='mikey@tilig.com']")
    end

    scenario 'places dropdown of suggestions if user clicks login field' do
      first('input[data-comsubshqforms]').click
      expect(page).to have_selector('div.subshq-dropdown-suggestions')
    end
  end
end
