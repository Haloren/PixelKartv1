# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Name1", email: "email1@email1.com", password: "password")
User.create(name: "Name2", email: "email2@email2.com", password: "password")

Garage.create(name: "Garage1")
Garage.create(name: "Garage2")

Kart.create(name: "Kart1", driver: "Driver1", color: "Red", body: "Body1", wheels: "Wheels1", garage_id: Garage.first.id, user_id: User.first.id)
Kart.create(name: "Kart2", driver: "Driver2", color: "Blue", body: "Body2", wheels: "Wheels2", garage_id: Garage.first.id, user_id: User.second.id)
Kart.create(name: "Kart3", driver: "Driver2", color: "Purple", body: "Body1", wheels: "Wheels2", garage_id: Garage.first.id, user_id: User.second.id)

Review.create(rating: 1, content: "Content 1", user_id: User.first.id, kart_id: Kart.first.id)
Review.create(rating: 2, content: "Content 2", user_id: User.second.id, kart_id: Kart.second.id)
Review.create(rating: 3, content: "Content 3", user_id: User.second.id, kart_id: Kart.second.id)