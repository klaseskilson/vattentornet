class Drink < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  belongs_to :DrinkType
end
