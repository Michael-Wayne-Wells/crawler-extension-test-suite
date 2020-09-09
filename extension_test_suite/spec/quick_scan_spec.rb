require 'feature_helper'
p 'QUICK SCAN'
@sites = File.read('sites.txt').split
@sites.each do |url|
  RSpec.feature "#{url} - Extension script" do
    scenario 'places logo in login' do
      visit url
      expect(page).to have_selector('div.subhq-subs-icon')
    end
  end
end
