class AddLabelToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :label_id, :string
  end
end
