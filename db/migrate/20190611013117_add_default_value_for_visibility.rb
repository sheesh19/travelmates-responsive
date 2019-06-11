class AddDefaultValueForVisibility < ActiveRecord::Migration[5.2]
  def change
       change_column :itineraries, :visibility, :integer, :default => 0
  end
end
