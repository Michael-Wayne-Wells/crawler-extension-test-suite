require 'feature_helper'
@sites = File.read('sites.txt').split
@sites.each do |url|
  RSpec.feature "#{url} - Extension script" do
    after do
      Capybara.current_session.driver.quit
    end
    scenario 'places logo in login' do
      visit url
      expect(page).to have_selector('div.subhq-subs-icon')
    end
  end
end
