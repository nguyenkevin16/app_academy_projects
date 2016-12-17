# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Cat.create(birthdate: "2005-1-5", color: "grey", name: "Scrappy", sex: "M", description: "mangled" )
cat2 = Cat.create(birthdate: "2004-10-13", color: "auburn", name: "Garfield", sex: "M", description: "fat" )
