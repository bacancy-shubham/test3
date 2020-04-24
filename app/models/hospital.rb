class Hospital < ApplicationRecord
  has_many :doctors
  # belongs_to :user
end
