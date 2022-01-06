class Flat < ApplicationRecord
  belongs_to :user

  validates :title, :location, presence: true
  validates :description, length: { minimum: 10 }
  validates :price, numericality: { only_integer: true }
end
