class Order < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_store
  # belongs_to :medicine_stock
end
