class Status < ApplicationRecord
  has_many :time_works

  validates :name, presence: true
end
