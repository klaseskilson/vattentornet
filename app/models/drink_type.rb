class DrinkType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
	has_many :drinks, -> {order('name')}
end
