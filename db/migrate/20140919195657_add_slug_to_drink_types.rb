class AddSlugToDrinkTypes < ActiveRecord::Migration
  def change
    add_column :drink_types, :slug, :string
    add_index :drink_types, :slug
  end
end
