# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Cat.create!(birth_date: "2005-1-5", color: "grey", name: "Scrappy", sex: "M", description: "mangled" )
cat2 = Cat.create!(birth_date: "2004-10-13", color: "auburn", name: "Garfield", sex: "M", description: "fat" )
cat3 = Cat.create!(birth_date: "2016-12-4", color: "white", name: "Roberta", sex: "F", description: "baby")
cat3 = Cat.create!(birth_date: "2006-7-15", color: "calico", name: "Sagwa", sex: "F", description: "siamese")

cat_rental1 = CatRentalRequest.create!(cat_id: 1, start_date: "2016-11-1", end_date: "2016-11-10", status: "APPROVED")
cat_rental2 = CatRentalRequest.create!(cat_id: 1, start_date: "2016-11-15", end_date: "2016-11-20", status: "APPROVED")
