class MedicineStock < ApplicationRecord
  belongs_to :medical_store
  has_many :orders, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
end
