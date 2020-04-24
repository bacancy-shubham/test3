class PrescriptionMedicine < ApplicationRecord
  belongs_to :prescription
  validates_presence_of :prescription
end
