require 'feature_helper'

@sites = File.read('sites.txt').split
@sites.each do |url|
  RSpec.feature "#{url} - Extension Script" do
    before(:each) do
      visit 'http://tilig-api:3000'
      sleep 1
      click_on 'Sign in with Google'
    end
    scenario 'places logo in login' do
      visit url
      expect(page).to have_selector('div.subhq-subs-icon')
    end
    scenario 'places dropdown on login when selected' do
      visit url
      first('input[data-comsubshqforms]').click
      sleep 1
      expect(page).to have_selector('div.subshq-dropdown-suggestions')
      sleep 1
      expect(page).to have_content('Add to Tilig')
    end
    scenario 'opens save login modal if user does not have suggested password' do
      visit url
      first('input[data-comsubshqforms]').click

      sleep 1
      find('a.subshq-button').click
      sleep 2
      expect(page).to have_content('Save Login')
      expect(page).to have_content('Save')
      expect(page).to have_content('Cancel')
      expect(page).to have_selector('img.modal-logo')
    end
  end
end
