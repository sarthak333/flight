class AddBookingidToSeats < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :booking_id, :integer
  end
end
