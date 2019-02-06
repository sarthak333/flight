class Phlight < ApplicationRecord
  validates :name, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
end
