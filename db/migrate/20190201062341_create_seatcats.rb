class CreateSeatcats < ActiveRecord::Migration[5.2]
  def change
    create_table :seatcats do |t|
      t.string :name
      t.integer :row
      t.integer :column
      t.integer :baseprice
      t.references :seatconfig, foreign_key: true

      t.timestamps
    end
  end
end
