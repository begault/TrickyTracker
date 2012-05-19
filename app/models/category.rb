class Category < ActiveRecord::Base
  has_many :categories_task, :dependent => :destroy
  has_many :tasks, :through => :categories_task, :order => 'name'  
  belongs_to :project
end
