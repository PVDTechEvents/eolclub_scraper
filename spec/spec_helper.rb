require 'vcr'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock

  c.allow_http_connections_when_no_cassette = false
  c.configure_rspec_metadata!
end
