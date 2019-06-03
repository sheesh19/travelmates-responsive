class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :location, foreign_key: true
      t.references :itinerary, foreign_key: true
      t.references :activity, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_spots
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
