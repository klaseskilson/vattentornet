json.array!(@drinks) do |drink|
  json.extract! drink, :id, :name, :brewery, :country, :percentage, :price, :description, :instock
  json.drink_type drink.drink_type.name
  json.show_url stock_drink_url(drink.drink_type, drink)
  json.edit_drink_url edit_drink_url(drink, format: :html) if user_signed_in_and_admin?
end
