class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :project_manager, 
    :foreign_key => "manager", 
    :class_name  => "Person"
  has_and_belongs_to_many :people
  
  
  
  
end
