class AddApartmentNumberToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :apartment, :string
    add_column :bookings, :name, :string
  end
end
