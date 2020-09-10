require 'feature_helper'
@sites = File.read('sites.txt').split
@sites.each do |url|
  RSpec.feature "#{url} - Extension script" do
    before(:each) do
      visit 'http://tilig-api:3000'
      click_on 'Sign in with Google'
    end

    scenario 'places logo in login' do
      visit url
      expect(page).to have_selector('div.subhq-subs-icon')
    end

    scenario 'places dropdown on login when selected' do
      first('input[data-comsubshqforms]').click
      expect(page).to have_selector('div.subshq-dropdown-suggestions')
      expect(page).to have_content('Add to Tilig')
    end

    scenario 'open save login modal if user does not have suggested password' do
      first('input[data-comsubshqforms]').click
      find('a.subshq-button').click
      expect(page).to have_content('Save Login')
      expect(page).to have_content('Save')
      expect(page).to have_content('Cancel')
      expect(page).to have_selector('img.modal-logo')
    end
  end
end
