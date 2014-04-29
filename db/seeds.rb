# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = User.create!({username: "serdavos@dragonstoneballerz.com", password: "qwerty"})
b = User.create!({username: "hodor@hodor.hodor", password: "qwerty"})
c = User.create!({username: "robb@redwedding.com", password: "qwerty"})
d = User.create!({username: "tyrion@halfman.org", password: "qwerty"})

Circle.create!(owner_id: d.id, name: "Homies", user_ids: [a.id, b.id, c.id])
Circle.create!(owner_id: a.id, name: "that fucking halfman", user_ids: [d.id])