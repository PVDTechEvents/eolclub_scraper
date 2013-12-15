require "eolclub_scraper/version"
require "eolclub_scraper/homepage"
require "eolclub_scraper/event_parser"

module EolclubScraper

  def self.scheduled_event
    homepage = Homepage.new
    parser = EventParser.new
    parser.parse(homepage.content)
  end

end
