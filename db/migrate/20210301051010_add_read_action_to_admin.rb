class AddReadActionToAdmin < ActiveRecord::Migration[6.1]
  def change
  	add_column :admins, :read_action, :string, array: true, :default =>[]
  	add_column :admins, :create_action, :string, array: true, :default =>[]
  	add_column :admins, :update_action, :string, array: true, :default =>[]
  	add_column :admins, :delete_action, :string, array: true, :default =>[]
  end
end
