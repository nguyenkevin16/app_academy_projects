# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u_one = User.create(email: 'first@email.com')
u_two = User.create(email: 'second@email.com')

ShortenedUrl.create(short_url: '1234', long_url: '123456.com', user_id: 1)
