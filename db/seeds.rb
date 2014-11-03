# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

joe = User.create!(email: 'joe@johnson.com', first_name: 'Joseph', last_name: 'Johnson', password: 'password', password_confirmation: 'password')
joe.tasks.create([{title: "Some Task Here", is_complete: true},
                  {title: "Another Task", is_complete: false},
                  {title: "Super Duper Task", is_complete: false}])
