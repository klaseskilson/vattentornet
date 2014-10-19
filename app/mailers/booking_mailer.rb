class BookingMailer < ActionMailer::Base
  default from: "info@vattentor.net"

  def booking_received_booker(booking)
    @booking = booking
    mail subject: "Ny bokningsforfragan", to: @booking.email
  end

  def booking_received_board(booking)
    @booking = booking
    mail subject: "Ny bokningsforfragan", to: "info@vattentor.net"
  end

  def booking_confirmed(booking)
    @booking = booking
    mail subject: "Bokning bekraftad", to: @booking.email
  end
end
