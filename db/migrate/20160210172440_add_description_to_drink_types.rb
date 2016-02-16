class AddDescriptionToDrinkTypes < ActiveRecord::Migration
  def change
    add_column :drink_types, :description, :string
  end
end
