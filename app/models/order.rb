class Order < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_store
end
