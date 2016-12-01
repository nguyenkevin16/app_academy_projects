# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u_one = User.create(email: 'first@email.com')
u_two = User.create(email: 'second@email.com')

url_one = ShortenedUrl.create_for_user_and_long_url!(u_one, "starbucks.com")
url_two = ShortenedUrl.create_for_user_and_long_url!(u_two, "appacademy.io")

tag_one = TagTopic.create(topic: "Programming")
tag_two = TagTopic.create(topic: "Coffee")
tag_three = TagTopic.create(topic: "Drink")

Tagging.create(topic_id: tag_one.id, url_id: url_two.id)
Tagging.create(topic_id: tag_two.id, url_id: url_one.id)
Tagging.create(topic_id: tag_three.id, url_id: url_one.id)
