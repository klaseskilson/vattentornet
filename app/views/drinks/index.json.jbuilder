json.array!(@drinks) do |drink|
  json.extract! drink, :id, :name, :brewery, :country, :percentage, :price, :DrinkType_id
  json.url drink_url(drink, format: :json)
end
