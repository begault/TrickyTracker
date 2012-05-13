class AddColumnParentIdFromComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :parent_id, :string
  end
  
  def self.down
    remove_column :comments, :parent_id
  end
end
