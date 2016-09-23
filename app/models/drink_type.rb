class DrinkType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :ordered_by_name, -> { order(name: :asc) }

  has_many :drinks
end
