class DrinkType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order(name: :asc) }

  has_many :drinks
end
