class Task < ActiveRecord::Base
  belongs_to :stopover
  belongs_to :priority
  belongs_to :project
  has_and_belongs_to_many :people
end
