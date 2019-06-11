class AddDefaultValueForTripType < ActiveRecord::Migration[5.2]
  def change
    change_column :itineraries, :trip_type, :integer, :default => 0
  end
end
