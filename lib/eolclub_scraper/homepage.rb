require 'open-uri'

module EolclubScraper

  class Homepage
    def initialize(url='http://eolclub.org/')
      @url = url
    end

    def content
      open(@url).read
    end
  end

end
