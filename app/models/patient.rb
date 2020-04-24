class Patient < ApplicationRecord
  has_many :doctors, through: :requests
  has_many :appoiments
  has_many :doctors, through: :appoiments
  has_many :orders
  belongs_to :user
  enum gender: %i[male female]
end
