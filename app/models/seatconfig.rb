class Seatconfig < ApplicationRecord
  has_many :seatcats
  validates :name, presence: true
end
