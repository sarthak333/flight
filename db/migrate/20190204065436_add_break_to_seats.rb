class AddBreakToSeats < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :break, :integer
  end
end
