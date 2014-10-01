class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :date
      t.text :description
      t.string :email
      t.boolean :pub
      t.boolean :confirmed
      t.references :user, index: true

      t.timestamps
    end
  end
end
