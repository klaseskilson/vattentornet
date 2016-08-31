class DrinkType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :drinks, -> { ordered_by_title }
end
