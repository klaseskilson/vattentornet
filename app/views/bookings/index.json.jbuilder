json.array!(@bookings) do |booking|
  json.extract! booking, :date, :pub, :confirmed, :public, :id
  json.url edit_booking_url(booking)
end
