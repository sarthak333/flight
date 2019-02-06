class AddShowToSeatconfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :seatconfigs, :show, :boolean, default: true
  end
end
