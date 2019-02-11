class Booking < ApplicationRecord
  has_many :tempseats
  before_create :create_pnr

  def create_pnr
    loop do
  self.pnr = SecureRandom.hex(4)
  break unless self.class.exists?(:pnr => pnr)
end
  end
end
