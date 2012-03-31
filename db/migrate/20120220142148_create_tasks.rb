class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.text :description
      t.date :tmp_achievement_date
      t.date :effective_achievement_date
      t.integer :priority_id
      t.integer :stopover_id
      t.integer :author

      t.timestamps
    end
  end
end
