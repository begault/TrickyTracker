# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#people = Person.create([{:name => "sylvestre", :encrypted_password => "facd1f02268439992db3939dbbb37c3f7450ee933226895399f31400fad4da08", :salt => "Re+HJr+agN1W", :email_address => "sylvestre.antoine@gmail.com"}])




role = Role.create([{:name => "super_admin"}, {:name => "project_team"}])
role_person = RolesPerson.create([{:role_id => 1, :person_id => 1}])
person = Person.create([{:name => "agathe", :encrypted_password => "fb13ad6022d7f55ebf8b9bd38a7a8c47d1fe8152727847d8efe92853b6d9e6eb", :salt => "sxDn9Pgs+4bt", :email_address => "agathe.begault@gmail.com", :created_at => "2008-10-24 22:06:18 +0200", :updated_at => "2008-10-24 22:06:18 +0200"}])

puts "\n person: #{person.to_json}"
