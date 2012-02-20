class CreateProjectsPeople < ActiveRecord::Migration
  def change
    create_table :projects_people do |t|
      t.integer :project_id
      t.integer :person_id
      t.text :job_description

      t.timestamps
    end
  end
end
