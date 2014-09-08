json.array!(@drink_types) do |drink_type|
  json.extract! drink_type, :id, :name
  json.url drink_type_url(drink_type, format: :json)
end
