class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :campervan
  # validates :start_date, presence: true
  # validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
  validates_presence_of :start_date, :end_date
  validate :end_date_is_after_start_date
  validate :start_date_is_before_today


  def total_price
     self.total_price = (self.end_date - self.start_date) * self.campervan.price
  end

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end

  def start_date_is_before_today
    if start_date < Date.today
      errors.add(:start_date, "date cannot be before today")
    end
  end


end
