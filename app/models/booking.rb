class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :campervan
  validates :start_date, :end_date, presence: true

  def total_price
     self.total_price = (self.end_date - self.start_date) * self.campervan.price
  end



end
