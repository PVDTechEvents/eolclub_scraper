require 'spec_helper'
require 'eolclub_scraper/homepage'

describe EolclubScraper::Homepage do

  describe '#content', :vcr do
    it 'fetches the body content from the EOL Club homepage' do
      expect( subject.content ).to include( 'Monthly Providence, RI hacknight.' )
    end
  end

end
