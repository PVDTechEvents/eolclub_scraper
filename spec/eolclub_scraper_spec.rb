require 'eolclub_scraper'

describe EolclubScraper do

  describe '.scheduled_event' do
    let(:content) { double }
    let(:event) { double }

    before do
      EolclubScraper::Homepage.any_instance.stub(:content) { content }
      EolclubScraper::EventParser.any_instance.stub(:parse).with(content) { event }
    end

    it 'parses an Event from the EOL Club homepage' do
      expect(EolclubScraper.scheduled_event).to eq(event)
    end
  end

end
