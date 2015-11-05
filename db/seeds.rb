# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

DrinkType.create(name: 'Lager')
DrinkType.create(name: 'IPA')
DrinkType.create(name: 'DIPA')
DrinkType.create(name: 'Stout')

Drink.create(name: "test-lager #1", brewery:"Toilet Brewery", country: 'Sweden',
             percentage: 5.6, price: 10, instock: true, description: "god Lager",
             drink_type_id: DrinkType.find_by(:name => 'Lager').id )
Drink.create(name: "test-IPA #1", brewery:"Toilet Brewery", country: 'Sweden',
             percentage: 5.6, price: 10, instock: true, description: "god IPA",
             drink_type_id: DrinkType.find_by(:name => 'IPA').id )
Drink.create(name: "test-DIPA #1", brewery:"Toilet Brewery", country: 'Sweden',
             percentage: 5.6, price: 10, instock: true, description: "god DIPA",
             drink_type_id: DrinkType.find_by(:name => 'DIPA').id )
Drink.create(name: "test-Stout #1", brewery:"Toilet Brewery", country: 'Sweden',
             percentage: 5.6, price: 10, instock: true, description: "god Stout",
             drink_type_id: DrinkType.find_by(:name => 'Stout').id )
