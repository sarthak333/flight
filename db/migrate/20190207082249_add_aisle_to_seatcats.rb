class AddAisleToSeatcats < ActiveRecord::Migration[5.2]
  def change
    add_column :seatcats, :aisle, :integer
  end
end
