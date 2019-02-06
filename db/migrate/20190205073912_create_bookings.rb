class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :flight_id
      t.text :pnr
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
