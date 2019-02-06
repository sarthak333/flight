class Seatcat < ApplicationRecord
  belongs_to :seatconfig
  has_many :seats
  validates :name, presence: true
  validates :row, presence: true
  validates :column, presence: true
  validates :baseprice, presence: true
end
