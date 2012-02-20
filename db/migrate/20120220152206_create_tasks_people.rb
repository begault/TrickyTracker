class CreateTasksPeople < ActiveRecord::Migration
  def change
    create_table :tasks_people do |t|
      t.integer :task_id
      t.integer :person_id

      t.timestamps
    end
  end
end
