class Phlight < ApplicationRecord
  validates :name, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :fdate, presence: true
  validates :ftime, presence: true
end
