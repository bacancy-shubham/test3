class Appoiment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  # validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past  
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
