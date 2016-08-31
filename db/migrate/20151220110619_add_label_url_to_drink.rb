class AddLabelUrlToDrink < ActiveRecord::Migration
  def change
    add_column :drinks, :label_url, :string
  end
end
