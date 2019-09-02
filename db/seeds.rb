# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
Cart.destroy_all
Order.destroy_all
User.destroy_all

20.times do
	user = User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end

50.times do 
	item = Item.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(sentence_count: 2), price: rand(0.01..99.99))
end

