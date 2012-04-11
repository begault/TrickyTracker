class PeopleTask < ActiveRecord::Base
  belongs_to :task
  belongs_to :person
  
end
