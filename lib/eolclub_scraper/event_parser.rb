require 'eolclub_scraper/event'
require 'nokogiri'
require 'chronic'

module EolclubScraper

  class EventParser

    # This method is extremely fragile, but so far EOLclub.org has been sticking to
    # the same format, so that may be okay.
    def parse(content)
      doc = Nokogiri::HTML.parse(content)
      schedule_text = doc.css('p')[1].text.split("\n")[2].split(',').last.strip.split
      start_time, end_time = schedule_text.last.split('–')

      Event.new(
        Chronic.parse( [ schedule_text[0], schedule_text[1], start_time ].join(' ') ),
        Chronic.parse( [ schedule_text[0], schedule_text[1], end_time ].join(' ') )
      )
    end

  end

end
