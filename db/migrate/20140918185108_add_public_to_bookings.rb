class AddPublicToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :public, :boolean
  end
end
