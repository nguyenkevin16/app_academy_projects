# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create!(username: "luke", password: "skywalker")
user2 = User.create!(username: "gage", password: "gagerage")

cat1 = Cat.create!(birth_date: "2011-5-4", color: "orange", name: "Garfield", sex: "M", description: "lasagna", user_id: 1)
cat1 = Cat.create!(birth_date: "2010-12-4", color: "black", name: "Leonard", sex: "M", description: "mom's cat", user_id: 2)
