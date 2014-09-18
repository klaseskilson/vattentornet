json.array!(@bookings) do |booking|
  json.extract! booking, :id, :date, :description, :email, :pub, :confirmed, :user_id
  json.url booking_url(booking, format: :json)
end
