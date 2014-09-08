class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :brewery
      t.string :country
      t.float :percentage
      t.float :price
      t.belongs_to :DrinkType, index: true

      t.timestamps
    end
  end
end
