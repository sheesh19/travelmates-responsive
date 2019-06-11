class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :group_type, :trip_type
  end
end
