json.last_updated l @updated.to_date, format: :long
json.drink_list(@drink_types) do |drink_type|
  json.extract! drink_type, :id, :name, :description
  json.url stock_url(drink_type)
  json.admin_url edit_drink_type_url(drink_type)
  json.drinks drink_type.drinks.ordered_by_name.where(instock: true).select('name', 'country', 'price', 'slug', 'brewery') do |drink|
    json.url stock_drink_url(drink_type, drink)
    json.name drink.name
    json.brewery drink.brewery
    json.country drink.country
    json.price drink.price.to_i
    json.drank true if @drank.include?(drink.slug)
  end
end
