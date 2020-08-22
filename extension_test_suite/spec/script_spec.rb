require 'feature_helper'

@sites = File.read('sites.txt').split
@sites.each do |url|
  RSpec.feature "#{url} - Extension Script" do
    scenario 'places logo in login' do
      visit url
      expect(page).to have_selector('div.subhq-subs-icon')
    end
    scenario 'places dropdown on login when selected' do
      visit url
      first('input[data-comsubshqforms]').click
      expect(page).to have_selector('div.subshq-dropdown-suggestions')
    end
  end
end
