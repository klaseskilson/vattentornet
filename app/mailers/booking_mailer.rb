class BookingMailer < ActionMailer::Base
  default to: "bokning@vattentor.net"
  default from: "bokning@vattentor.net"


  def booking_notice(booking)
    @booking = booking
    @url = "http://www.vattentor.net"
    mail subject: "Ny bokningsförfrågan"
  end
end
