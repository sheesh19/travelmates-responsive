class CreateEventRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :event_registrations do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null:false

      t.timestamps
    end
  end
end
