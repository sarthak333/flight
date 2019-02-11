class AddDatetimeToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :sdate, :date
    add_column :searches, :stime, :time
  end
end
