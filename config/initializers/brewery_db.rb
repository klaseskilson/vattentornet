BREWERY = BreweryDB::Client.new do |config|
  t = ENV['BREWERYDB_API_KEY']
  config.logger = Rails.logger
  config.api_key = t
end
