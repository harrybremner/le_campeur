class Campervan < ApplicationRecord
  validates :camper_type, presence: true
  validates :camper_make, presence: true
  validates :price, presence: true
  validates :address, presence: true
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
