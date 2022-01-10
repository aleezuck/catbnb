class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  enum status: { pending: 0, approved: 1, declined: 2 }, _prefix: true

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after starting date")
    end
 end
end
