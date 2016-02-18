require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test 'it should fail creating a unconfirmed booking' do
    assert_difference('Booking.count', 0) do
      # no email!
      Booking.create(date: '2015-11-11', name: 'Test', description: 'Party', apartment: 1)
    end
  end

  test 'it should create a public booking' do
    assert_difference('Booking.count', 1) do
      Booking.create(date: '2015-11-12', public: true, apartment: 1)
    end
  end

  test 'it should not create duplicate bookings on same date' do
    assert_difference('Booking.count', 1) do
      Booking.create(date: '2015-11-13', name: 'Test', description: 'Party', email: 'test@examp.le', confirmed: true, apartment: 1)
      # conflicting date!
      Booking.create(date: '2015-11-13', name: 'Test', description: 'Party', email: 'test@examp.le', apartment: 1)
    end
  end

  test 'it should create duplicate bookings on same date since none are confirmed' do
    assert_difference('Booking.count', 2) do
      Booking.create(date: '2015-11-13', name: 'Test', description: 'Party', email: 'test@examp.le', apartment: 1)
      # conflicting date!
      Booking.create(date: '2015-11-13', name: 'Test', description: 'Party', email: 'test@examp.le', apartment: 1)
    end
  end
end
