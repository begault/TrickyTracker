class CreateCategoriesTasks < ActiveRecord::Migration
  def self.up
    create_table :categories_tasks do |t|
      t.integer :category_id
      t.integer :task_id

      t.timestamps
    end
  end
  def self.down
    drop_table :categories_tasks
  end  
end
