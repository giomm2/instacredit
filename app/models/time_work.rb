class TimeWork < ApplicationRecord
  belongs_to :employee
  belongs_to :location
  belongs_to :status

  validates :start_date, :finish_date, presence: true
end
