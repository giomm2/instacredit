class Employee < ApplicationRecord
  has_many :time_works

  validates :name, :last_name, :identification, presence: true
end
