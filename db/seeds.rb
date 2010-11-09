# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "seed begin ..."
for tag in SITE_SETTINGS["default_tags"]
  Tag.create(:name => tag)
end

User.create(
  :name => "liwei", 
  :email => "liwei@123.com", 
  :password => "liwei"
)

puts "... seed finish"