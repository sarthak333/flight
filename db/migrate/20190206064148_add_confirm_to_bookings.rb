class AddConfirmToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :confirm, :boolean, default: false
  end
end
