class CreateEventReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :event_reviews do |t|
      t.references :event, foreign_key: true
      t.text :comments
      t.integer :rating

      t.timestamps
    end
  end
end
