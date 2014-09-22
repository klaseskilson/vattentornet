class Booking < ActiveRecord::Base
  belongs_to :user
  attr_accessor :interval, :end_date, :weekdays
end
