class AddNumberToSeats < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :number, :integer
  end
end
