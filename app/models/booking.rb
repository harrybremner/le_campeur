class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :campervan

  validates :start_date, :end_date, :price, :price_per_night, presence: true
end
