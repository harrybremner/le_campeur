class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :camper_van

  validates :start_date, :end_date, :price, :price_per_night, presence: true
end
