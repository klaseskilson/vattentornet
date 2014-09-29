class RenameDrinksDrinkTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :drinks, :DrinkType_id, :drink_type_id
  end
end
