class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :requests
  has_many :my_patients, through: :requests, source: :patient 
  has_many :appoiments
  has_many :patients, through: :appoiments
  has_many :availabilities
  has_many :select_months, dependent: :destroy
end
