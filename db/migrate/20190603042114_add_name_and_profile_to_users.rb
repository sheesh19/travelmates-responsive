class AddNameAndProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :description, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :avatar, :string
  end
end
