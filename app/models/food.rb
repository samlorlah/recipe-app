class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
