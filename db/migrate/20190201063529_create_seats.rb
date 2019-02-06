class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :pnr
      t.string :position, default: "middle"
      t.boolean :available, default: true
      t.boolean :emergency, default: false
      t.references :seatcat, foreign_key: true

      t.timestamps
    end
  end
end
