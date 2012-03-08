class CreatePeopleProjects < ActiveRecord::Migration
  def change
    create_table :people_projects do |t|
      t.integer :project_id
      t.integer :person_id
      t.text :job_description

      t.timestamps
    end
  end
end
