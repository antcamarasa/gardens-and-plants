class Tag < ApplicationRecord
  NAMES = %w[Tree Fruit Flower]

  has_many :plant_tags
  has_many :plants, through: :plant_tags

  validates :name, presence: true
  validates :name, inclusion: { in: NAMES }
end
