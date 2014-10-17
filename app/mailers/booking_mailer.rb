class BookingMailer < ActionMailer::Base
  default from: "bokning@vattentor.net"

  def booking_received_booker(booking)
    @booking = booking
    mail subject: "Ny bokningsforfragan", to: @booking.email
  end

  def booking_received_board(booking)
    @booking = booking
    mail subject: "Ny bokningsforfragan", to: "bokning@vattentor.net"
  end

  def booking_confirmed(booking)
    @booking = booking
    mail subject: "Bokning bekraftad", to: @booking.email
  end
end
