class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats
  has_many :bookings
  has_many :reservations, through: :flats, source: :bookings

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
