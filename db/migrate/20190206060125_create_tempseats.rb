class CreateTempseats < ActiveRecord::Migration[5.2]
  def change
    create_table :tempseats do |t|
      t.integer :price
      t.text :pnr
      t.integer :seat_id
      t.boolean :emergency
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
