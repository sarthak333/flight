class AddOldToTempseats < ActiveRecord::Migration[5.2]
  def change
    add_column :tempseats, :old, :boolean, default: true
    add_column :tempseats, :final, :boolean, default: false
  end
end
