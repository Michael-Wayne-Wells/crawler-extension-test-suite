require 'feature_helper'
@sites = File.read('sites_quick.txt').split
@sites.each do |url|
  RSpec.feature "#{url} - Exitension script load" do
    scenario 'places form-sig on login forms and fields' do
      visit url
      expect(page).to have_selector('[data-comsubshqforms]')
    end
    scenario 'injects watcher script' do
      visit url
      expect(page).to have_selector('#subshqwatcherscript', visible: false)
    end
  end
end
