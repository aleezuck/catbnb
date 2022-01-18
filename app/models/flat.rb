class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :location, :description, :photos, presence: true
  validates :description, length: { minimum: 10 }
  validates :price, numericality: { only_integer: true }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def unavailable_dates
    bookings.where("start_date >= ? OR end_date >= ?", Date.today, Date.today)
            .where.not(status: 'declined').pluck(:start_date, :end_date)
            .map do |range|
              { from: range[0], to: range[1] }
    end
  end
end
