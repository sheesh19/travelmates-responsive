class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.integer :trip_type, default: 0, null:false
      t.integer :visibility, default: 0, null:false
      t.integer :status, default: 0, null:false

      t.timestamps
    end
  end
end
