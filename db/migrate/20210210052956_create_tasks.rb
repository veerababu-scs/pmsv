class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
    	t.string :name
    	t.string :title
    	t.integer :task_time
    	t.string :status
    	t.datetime :task_date
      t.timestamps
    end
  end
end
