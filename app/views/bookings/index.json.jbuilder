json.array!(@bookings) do |booking|
  json.extract! booking, :date, :pub, :confirmed
end
