class CategoriesTask < ActiveRecord::Base
  belongs_to :task
  belongs_to :category 
end
