class CreatePeopleTasks < ActiveRecord::Migration
  def change
    create_table :people_tasks do |t|
      t.integer :task_id
      t.integer :person_id

      t.timestamps
    end
  end
end
