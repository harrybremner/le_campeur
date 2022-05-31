class Campervan < ApplicationRecord
  validates :camper_type, presence: true
  validates :camper_make, presence: true
  validates :price, presence: true
  validates :address, presence: true
  belongs_to :user
  has_many :bookings
end
