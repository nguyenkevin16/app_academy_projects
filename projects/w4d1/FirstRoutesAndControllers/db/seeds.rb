# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'kevin')
User.create!(username: 'gage')
User.create!(username: 'debra')

Contact.create!(name: 'Kevin', email: 'kevin@aa.io', owner_id: 2)
Contact.create!(name: 'Kevin', email: 'kevin@aa.io', owner_id: 3)
Contact.create!(name: 'Luke', email: 'luke@aa.io', owner_id: 1)
Contact.create!(name: 'Luke', email: 'luke@aa.io', owner_id: 2)
Contact.create!(name: 'Luke', email: 'luke@aa.io', owner_id: 3)
Contact.create!(name: 'Debra', email: 'debra@aa.io', owner_id: 2)
Contact.create!(name: 'Gage', email: 'gage@aa.io', owner_id: 3)

ContactShare.create!(share_with_id: 1, contact_id: 4)
ContactShare.create!(share_with_id: 3, contact_id: 7)
ContactShare.create!(share_with_id: 1, contact_id: 6)
