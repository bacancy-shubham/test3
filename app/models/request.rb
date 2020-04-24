class Request < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  enum status: %i[pending accepted]
end
