# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user_1 = User.create(email: "bob@bob.com", password: "123456", first_name: "bob", last_name: "jones", address: "123 way")
user_2 = User.create(email: "suzy@suzy.com", password: "78910", first_name: "suzy", last_name: "johnson", address: "456 olive")
user_3 = User.create(email: "peter@peter.com", password: "111213", first_name: "peter", last_name: "jeff", address: "789 lane")

40.times do
  offer = Offer.new(
    name: Faker::Games::Pokemon.name,
    equipment_type: Faker::Creature::Animal.name,
    description: Faker::TvShows::StrangerThings.quote,
    price: rand(1..500),
    equipment_category: CATEGORIES.sample,
    user: User.all.sample
  )
  offer.save!
end

puts "Offers created"
