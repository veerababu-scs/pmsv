class AddDeatailsToUsers < ActiveRecord::Migration[6.1]
  def change
  	add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :dob, :string
    add_column :users, :role, :string
    add_column :users, :address, :string
    add_column :users, :mobile, :string
  end
end
