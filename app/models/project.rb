class Project < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  belongs_to :project_manager, 
    :foreign_key => "manager", 
    :class_name  => "Person"
  has_and_belongs_to_many :people,
    :class_name => "Person"
  
  def get_task_ids
    tab = []
    self.tasks.each do |task|
      tab<<task.id
    end
    return tab;
  end
  
  
end
