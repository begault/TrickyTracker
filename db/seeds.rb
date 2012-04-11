# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
people = Person.create([{:name => "agathe", :encrypted_password => "6d6ca39ab5b5803151ee4a15d3e83f8519479e39f292d58eebc7a1fb19f0df97", :salt => "GSb0ZSQYx4Zv", :email_address => "agathe.begault@gmail.com"}])
role = Role.create([{:name => "super_admin"}, {:name => "project_team"}])
role_person = RolesPerson.create([{:role_id => 1, :person_id => 1}])
