class AddTripTypeToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :trip_type, :integer
  end
end
