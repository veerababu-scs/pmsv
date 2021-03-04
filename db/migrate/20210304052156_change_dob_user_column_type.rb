class ChangeDobUserColumnType < ActiveRecord::Migration[6.1]
  def change
  	remove_column :users, :dob, :string
  	add_column :users, :dob, :date
  end
end
