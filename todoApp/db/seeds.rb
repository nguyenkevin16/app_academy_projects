# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.create(title: "todo1", body: "body1", done: false)
Todo.create(title: "todo2", body: "body2", done: false)
Todo.create(title: "todo3", body: "body3", done: true)
Todo.create(title: "todo4", body: "body4", done: true)

Tag.create(name: "Grocery")
Tagging.create!(todo_id: 2, tag_id: 1)
