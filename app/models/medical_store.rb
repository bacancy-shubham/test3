class MedicalStore < ApplicationRecord
  belongs_to :user
  has_many :medical_stocks, dependent: :destroy
  has_many :orders, dependent: :destroy
end
