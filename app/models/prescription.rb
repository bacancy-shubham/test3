class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_many :prescription_medicines, dependent: :destroy
  accepts_nested_attributes_for :prescription_medicines, allow_destroy: true, reject_if: :all_blank
end
