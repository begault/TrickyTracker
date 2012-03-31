class PeopleHaveAndBelongToManyRoles < ActiveRecord::Migration
   def self.up
    create_table :roles_people, :id => false do |t|
      t.references :role, :person
    end
  end
 
  def self.down
    drop_table :roles_users
  end
end
