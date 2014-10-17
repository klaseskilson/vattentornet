class Booking < ActiveRecord::Base
  belongs_to :user
  attr_accessor :interval, :end_date, :weekdays
  validates_presence_of :date, :description, :email
  validates_uniqueness_of :date

  def initialize(*args,&block)
    super
    @weekdays = []
  end
end
