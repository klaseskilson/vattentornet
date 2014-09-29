class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
