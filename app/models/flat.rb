class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :location, :description, :photos, presence: true
  validates :description, length: { minimum: 10 }
  validates :price, numericality: { only_integer: true }
end
