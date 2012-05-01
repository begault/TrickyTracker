class Category < ActiveRecord::Base
  has_many :categories_task, :dependent => :destroy
  
end
