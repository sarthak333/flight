class AddShowToAirplanes < ActiveRecord::Migration[5.2]
  def change
    add_column :airplanes, :show, :boolean, default: true
  end
end
