class RemoveColumnTaskIdFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :task_id
      end

  def down
    add_column :comments, :task_id, :integer
  end
end
