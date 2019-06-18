# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(first_name: "Hugo", last_name: "de la Fuente", email: "h@h.cl", password: "12345678")

address = Address.create(phone: "+569 1234 5678",
                         address_line_1: "Calle 1",
                         address_line_2: "depto. 123",
                         city: "Santiago",
                         country: "Chile",
                         zip_code: 12345678,
                         user_id: user.id)

UserAddress.create(user_id: user.id, address_id: address.id)


p1 = Product.create(brand: "Brand 1", model: "model 1",
               variant: "handsets", price: 10000,
               short_description: "short descr for product 1",
               long_description: "this is the long description for product 1, it's quite bad, don't buy it")

p2 = Product.create(brand: "Brand 2", model: "model 2",
               variant: "pre_pay", price: 1500000,
               short_description: "short descr for product 2",
               long_description: "this is the long description for product 2, it's kinda good, a bit expensive though")

p3 = Product.create(brand: "Brand 3", model: "model 3",
               variant: "subs", price: 20000,
               short_description: "short descr for product 3",
               long_description: "this is the long description for product 3, it's quite good, buy it")

order = Order.create(user_id: user.id, address: address)
OrderProduct.create(order_id: order.id, product_id: p1.id)
OrderProduct.create(order_id: order.id, product_id: p2.id)
OrderProduct.create(order_id: order.id, product_id: p3.id)
