class AddStockToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :instock, :boolean
  end
end
