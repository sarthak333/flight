class AddDatetimeToPhlights < ActiveRecord::Migration[5.2]
  def change
    add_column :phlights, :ftime, :time
    add_column :phlights, :fdate, :date
  end
end
