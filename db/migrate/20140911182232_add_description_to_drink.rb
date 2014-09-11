class AddDescriptionToDrink < ActiveRecord::Migration
  def change
    add_column :drinks, :description, :string, :default => 'Jättegod öl kanske'
  end
end
