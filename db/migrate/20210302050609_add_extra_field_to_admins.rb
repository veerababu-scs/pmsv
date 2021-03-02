class AddExtraFieldToAdmins < ActiveRecord::Migration[6.1]
  def change
  	add_index :admins, :read_action, using: 'gin'
  	add_index :admins, :create_action, using: 'gin'
  	add_index :admins, :update_action, using: 'gin'
  	add_index :admins, :delete_action, using: 'gin'
  end
end
