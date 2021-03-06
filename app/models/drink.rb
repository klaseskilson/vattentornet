class Drink < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  scope :ordered_by_name, -> { order(name: :asc) }

  belongs_to :drink_type
  validates :drink_type, presence: :true

  validates :price, numericality: { greater_than: 0, message: 'priset måste vara över %{count} kr' }
end
