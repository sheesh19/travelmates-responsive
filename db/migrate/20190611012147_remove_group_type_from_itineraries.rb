class RemoveGroupTypeFromItineraries < ActiveRecord::Migration[5.2]
  def change
    remove_column :itineraries, :group_type
  end
end
