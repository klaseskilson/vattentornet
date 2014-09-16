class AddStockAndDescriptionToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :description, :string
    add_column :drinks, :instock, :boolean
  end
end
