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

user_list = []
cart_list = []
item_list = []
order_list = []


20.times do
	user = User.create(email: Faker::Internet.email, password: Faker::Internet.password)
	cart = Cart.create(user: user)
	user_list << user
	cart_list << cart
end


40.times do 
	item = Item.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(sentence_count: 2), price: Faker::Number.decimal(l_digits: 2), image_url: Faker::LoremPixel.image, admin: user_list.sample)
    item_list << item 
end

20.times do 
	order = Order.create(user: user_list.sample)
	order_list << order
end

40.times do
	cart_items = JoinCartItem.create(cart: cart_list.sample, item: item_list.sample)
end

20.times do
	order_item = JoinOrderItem.create(order: order_list.sample, item: item_list.sample)
end




