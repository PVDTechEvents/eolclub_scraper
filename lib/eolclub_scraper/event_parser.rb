require 'eolclub_scraper/event'
require 'nokogiri'
require 'chronic'

module EolclubScraper

  class EventParser

    # This method is extremely fragile, but so far EOLclub.org has been sticking to
    # the same format, so that may be okay.
    def parse(content)
      doc = Nokogiri::HTML.parse(content)
      description = doc.css('p').first(3).map(&:to_html).join

      start_time = doc.css('abbr.dtstart').first.attributes['title'].value
      end_time = doc.css('abbr.dtend').first.attributes['title'].value

      Event.new(
        Time.parse(start_time),
        Time.parse(end_time),
        description
      )
    end

  end

end
