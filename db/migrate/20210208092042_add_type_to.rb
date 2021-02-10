class AddTypeTo < ActiveRecord::Migration[6.1]
  def change
  	add_column :projects, :project_type, :string, index:true
  end
end
