class Booking < ActiveRecord::Base
  belongs_to :user
  attr_accessor :interval, :end_date, :weekdays
  validates_presence_of :date, :description, :email
  validates_presence_of :apartment, :name, if: :is_not_public?
  validates_uniqueness_of :date, conditions: -> { where(confirmed: true) }, message: 'är taget'

  def initialize(*args,&block)
    super
    @weekdays = []
  end

  def is_not_public?
    !public
  end
end
