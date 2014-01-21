require 'timecop'
require 'eolclub_scraper/event_parser'

describe EolclubScraper::EventParser do

  describe '#parse' do
    let(:parsed) { subject.parse(content) }

    it 'parses an Event from the supplied content' do
      Timecop.freeze(Time.local(2013, 12, 28)) do
        expect( parsed.start_time ).to eq( Time.local(2014, 1, 13, 18, 0, 0) )
        expect( parsed.end_time ).to eq( Time.local(2014, 1, 13, 23, 0, 0) )
      end
    end

    it 'provides the HTML description from the scraped page' do
      desc = parsed.description
      expect(desc).to include("Monthly Providence, RI hacknight.")
      expect(desc).to include("Our next meetup is")
      expect(desc).to include("@EOLclub")
    end
  end

  let(:content) {
    <<-EOF
      <!DOCTYPE html>
      <html>
      <head>
        <meta http-equiv='content-type' content='text/html; charset=utf-8' />
        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0' />
        <title>End of Line Club // Providence, RI hacknight</title>
        <meta name='description' content='Monthly Providence, Rhode Island hacknight. Code, design, and collaborate with other local developers to a backdrop of electronic music.' />
        <link href='/stylesheets/screen.css' media='screen' rel='stylesheet' type='text/css' />
        <script type="text/javascript" src="http://use.typekit.com/vry7ulq.js"></script>
        <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
      </head>
      <body>
        <div id='container'>
          <header>
            <h1>End of Line Club</h1>
          </header>
          <section id='main'>
            <div class="vevent">
              <p class="description">
                Monthly Providence, RI hacknight. Code, design, and collaborate
                with other local developers to a backdrop of electronic music.
                Bring your laptop and a project to work on.
              </p>
              <p>
                The next <span class="summary">EOL Club</span>
                meetup is Monday, January 13th from
                <abbr class="dtstart" title="2014-01-13T18:00:00-05:00">6pm</abbr>&ndash;<abbr class="dtend" title="2014-01-13T23:00:00-05:00">11pm</abbr>
                at <a class="location" href="http://basicsgroup.com">Basics Group</a>.
                Arrive whenever you can. Food and beer provided.
              </p>
            </div>
            <p>
              <a href="https://twitter.com/EOLclub">@EOLclub</a>
              to get more info and RSVP.
            </p>
          </section>
        </div>
        <!--
          "Up there it's their time... their time.
          But down here it's our time. It's our time down here."
          - The Goonies

          Site design and coding by David Piehler (@dpie)
        -->
      </body>
      </html>
    EOF
  }

end
