json.array!(@drinks) do |drink|
  json.extract! drink, :id, :name, :brewery, :country, :percentage, :price, :description
  json.drink_type drink.drink_type.name
  json.show_url drink_url(drink, format: :html)
  json.edit_drink_url edit_drink_url(drink, format: :html) if user_signed_in_and_admin?
end
