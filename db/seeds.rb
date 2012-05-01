# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#people = Person.create([{:name => "sylvestre", :encrypted_password => "facd1f02268439992db3939dbbb37c3f7450ee933226895399f31400fad4da08", :salt => "Re+HJr+agN1W", :email_address => "sylvestre.antoine@gmail.com"}])




roles = Role.create([{:name => "super_admin"}, {:name => "project_team"}])
role_person = RolesPerson.create([{:role_id => 1, :person_id => 1}])
people = Person.create!([{:name => "agathe", :password => "agathe", :password_confirmation => "agathe" , :email_address => "agathe.begault@gmail.com"}])

stopovers = Stopover.create([{:name => "Open", :description => "First stage of an object", }])

priorities = Priority.create([{:name => "Low", :description => "Lowest level of priority"}, {:name => "Medium"}, {:name => "High", :description => "Highest level of priority"}])

puts "\n person: #{people.to_json}"
