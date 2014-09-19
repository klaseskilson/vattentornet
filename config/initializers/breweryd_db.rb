BREWERY = BreweryDB::Client.new do |config|
  t = ENV['BREWERYDB_API_KEY']
  config.api_key = t
end
