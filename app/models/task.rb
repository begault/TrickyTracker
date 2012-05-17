class Task < ActiveRecord::Base
  belongs_to :stopover
  belongs_to :priority
  belongs_to :project
  has_many :categories_tasks, :dependent => :destroy
  has_many :people_tasks, :dependent => :destroy
  has_many :people, :through => :people_tasks, :order => 'name'   
  has_many :categories, :through => :categories_tasks, :order => 'name'
  belongs_to :author, :class_name => 'Person', :foreign_key => 'author'  
  has_many :comments, :as => :parent
  
  validates :project, :presence => true
  validates :author, :presence => true
  validates :name, :presence => true 
     
     
  def categories_not_parent
    cat =  Category.all - self.categories
    return cat 
  end     
            
end
