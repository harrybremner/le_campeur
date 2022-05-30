class Campervan < ApplicationRecord
  validates :camper_type, :camper_make, :price, :address, presence: true
end
