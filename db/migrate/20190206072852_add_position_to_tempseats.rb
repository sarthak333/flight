class AddPositionToTempseats < ActiveRecord::Migration[5.2]
  def change
    add_column :tempseats, :position, :string
  end
end
