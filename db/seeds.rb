#Users
User.find_or create_by(name: 'Maria', email: 'maria@example.com', password: 'password', password_confirmation: 'password')
User.find_or_create_by(name: 'Dominik', email: 'dominik@example.com', password: 'password', password_confirmation: 'password')
User.find_or_create_by(name: 'Justyna', email: 'justyna@example.com', password: 'password', password_confirmation: 'password')
User.find_or_create_by(name: 'Grzegorz', email: 'grzegorz@example.com', password: 'password', password_confirmation: 'password')
User.find_or_create_by(name: 'Adam', email: 'adam@example.com', password: 'password', password_confirmation: 'password')

#Admin user
AdminUser.find_or_create_by(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

#Categories
vegetables = Category.find_or_create_by(name: 'Vegetables')
fruits = Category.find_or_create_by(name: 'Fruits')
fast_food = Category.find_or_create_by(name: 'Fast food')

#Products
Product.find_or_create_by(name: 'Carrot', description: 'Tasty carrots from organic farm.', price: 0.5, stock: 90, category: vegetables)
Product.find_or_create_by(name: 'Onion', description: 'Oraganic onions', price: 0.4, stock: 100, category: vegetables)
Product.find_or_create_by(name: 'Tomato', description: 'Organic tomatoes', price: 0.8, stock: 45, category: vegetables)

Product.find_or_create_by(name: 'Apple', description: 'Big red apples.', price: 1, stock: 55, category: fruits)
Product.find_or_create_by(name: 'Orange', description: 'Fresh oranges.', price: 2, stock: 67, category: fruits)
Product.find_or_create_by(name: 'Banana', description: 'Tasty bananas!', price: 3, stock: 36, category: fruits)

Product.find_or_create_by(name: 'Pizza', description: 'Round tasty pizza with cheese and chicken.', price: 20, stock: 10, category: fast_food)
Product.find_or_create_by(name: 'Kebab', description: 'Best kebab in the world.', price: 10, stock: 20, category: fast_food)
Product.find_or_create_by(name: 'Hot dog', description: 'Best hot dog in the world', price: 5, stock: 15, category: fast_food)
