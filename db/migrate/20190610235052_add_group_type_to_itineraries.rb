class AddGroupTypeToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :group_type, :integer
  end
end
