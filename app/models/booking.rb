class Booking < ActiveRecord::Base
  belongs_to :user
  attr_accessor :interval, :end_date, :weekdays
  validates_presence_of :date
  # the regex ensure the email is on the format something@something.somethinglongerthan2chars
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, if: :not_public?
  validates :apartment, numericality: { only_integer: true }, if: :not_pub?
  validates_presence_of :email, :name, :description, if: :not_public?
  validates_presence_of :apartment, if: :not_pub?
  validates_uniqueness_of :date, conditions: -> { where(confirmed: true) }, message: 'är taget'

  def initialize(*args, &block)
    super
    @weekdays = []
  end

  def not_public?
    !public
  end

  def not_pub?
    !pub
  end
end
