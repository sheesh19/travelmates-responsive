class AddVisibilityToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :visibility, :integer
  end
end
