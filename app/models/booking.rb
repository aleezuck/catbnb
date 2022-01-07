class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  enum status: { pending: 0, approved: 1, declined: 2 }, _prefix: true
end
