class CreateDrinkTypes < ActiveRecord::Migration
  def change
    create_table :drink_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
