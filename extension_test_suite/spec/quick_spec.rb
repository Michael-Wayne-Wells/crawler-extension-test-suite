require 'feature_helper'
@sites = File.read('sites.txt').split
@sites.each do |url|
  RSpec.feature "#{url} - Exitension script load" do
    scenario 'places logo in login' do
      visit url
      expect(page).to have_selector('div.subhq-subs-icon')
    end
  end
end
