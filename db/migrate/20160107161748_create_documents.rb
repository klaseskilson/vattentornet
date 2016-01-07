class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :document_id

      t.timestamps null: false
    end
  end
end
