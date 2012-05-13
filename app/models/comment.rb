class Comment < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  belongs_to :author, :class_name => 'Person', :foreign_key => 'user_id'
  
  validates :description, :presence => true

  def self.find_by_type(parent)
    comment = Comment.find(:all, :conditions => "parent_type = '#{parent.class}' and parent_id = #{parent.id}", :order => "created_at")
  end

end
