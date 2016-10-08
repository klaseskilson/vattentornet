json.last_updated @updated
json.drink_list(@drink_types) do |drink_type|
  json.extract! drink_type, :id, :name
  json.url stock_url(drink_type)
  json.admin_url edit_drink_type_url(drink_type)
  json.drinks drink_type.drinks.where(instock: true).select("name", "country", "price", "slug") do |drink|
    json.url stock_drink_url(drink_type, drink)
    json.drink_url drunk_url(drink)
    json.name drink.name
    json.country drink.country
    json.price drink.price.to_i
    if @drank.include?(drink.slug)
      json.drank true
    end
  end
end
