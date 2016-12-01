# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(user_name: "Mark")
User.create!(user_name: "Kevin")
User.create!(user_name: "Gage")
User.create!(user_name: "Debra")
User.create!(user_name: "Luke")
User.create!(user_name: "Matthew")

Poll.create!(title: "Ocean Beach Poll", author_id: 3)
Poll.create!(title: "Let's talk about feelings.", author_id: 2)

Question.create!(body: "How do you like brocean beach station 12?", poll_id: 1)
Question.create!(body: "How's my hair?", poll_id: 1)
Question.create!(body: "How are you feeling?", poll_id: 2)
Question.create!(body: "Are you feeling sad?", poll_id: 2)

AnswerChoice.create!(body: "Like it", question_id: 1)
AnswerChoice.create!(body: "Don't like it", question_id: 1)
AnswerChoice.create!(body: "Like it", question_id: 2)
AnswerChoice.create!(body: "Love it", question_id: 2)
AnswerChoice.create!(body: "Sad", question_id: 3)
AnswerChoice.create!(body: "Fatigued", question_id: 3)
AnswerChoice.create!(body: "Yes", question_id: 4)
AnswerChoice.create!(body: "Completely hopeless", question_id: 4)

Response.create!(answer_choice_id: 8, user_id: 1)
Response.create!(answer_choice_id: 4, user_id: 2)
Response.create!(answer_choice_id: 8, user_id: 3)
Response.create!(answer_choice_id: 2, user_id: 3)
Response.create!(answer_choice_id: 1, user_id: 6)
Response.create!(answer_choice_id: 2, user_id: 4)
