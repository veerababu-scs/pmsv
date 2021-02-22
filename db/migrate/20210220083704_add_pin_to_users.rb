class AddPinToUsers < ActiveRecord::Migration[6.1]
  def change
  	  	add_column :users, :ga_pin, :bigint
  end
end
