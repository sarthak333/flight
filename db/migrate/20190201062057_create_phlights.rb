class CreatePhlights < ActiveRecord::Migration[5.2]
  def change
    create_table :phlights do |t|
      t.integer :airplane_id
      t.integer :seatconfig_id
      t.string :origin
      t.string :destination
      t.string :name

      t.timestamps
    end
  end
end
