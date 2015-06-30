#Users
User.create(name: 'Dominik', email: 'dominik@example.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Justyna', email: 'justyna@example.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Grzegorz', email: 'grzegorz@example.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Adam', email: 'adam@example.com', password: 'password', password_confirmation: 'password')

#Admin user
User.create(name: 'Maria', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)

#Categories
vegetables = Category.find_or_create_by(name: 'Vegetables')
fruits = Category.find_or_create_by(name: 'Fruits')
fast_food = Category.find_or_create_by(name: 'Fast food')

#Products
Product.find_or_create_by(name: 'Carrot', description: 'Tasty carrots from organic farm.', price: 0.5, stock: 90, image: File.open(Rails.root + "app/assets/images/Baby_Carrots_2.jpg"), category: vegetables)
Product.find_or_create_by(name: 'Onion', description: 'Oraganic onions', price: 0.4, stock: 100, image: File.open(Rails.root + "app/assets/images/spanish-onions.jpg"), category: vegetables)
Product.find_or_create_by(name: 'Tomato', description: 'Organic tomatoes', price: 0.8, stock: 45, image: File.open(Rails.root + "app/assets/images/tomato.jpg"), category: vegetables)

Product.find_or_create_by(name: 'Apple', description: 'Big red apples.', price: 1, stock: 55, image: File.open(Rails.root + "app/assets/images/apple.jpg"), category: fruits)
Product.find_or_create_by(name: 'Orange', description: 'Fresh oranges.', price: 2, stock: 67, image: File.open(Rails.root + "app/assets/images/Oranges.jpg"), category: fruits)
Product.find_or_create_by(name: 'Banana', description: 'Tasty bananas!', price: 3, stock: 36, image: File.open(Rails.root + "app/assets/images/Health-Benefits-of-Bananas.jpg"), category: fruits)

Product.find_or_create_by(name: 'Pizza', description: 'Round tasty pizza with cheese and chicken.', price: 20, stock: 10, image: File.open(Rails.root + "app/assets/images/1412364564.jpg"), category: fast_food)
Product.find_or_create_by(name: 'Kebab', description: 'Best kebab in the world.', price: 10, stock: 20, image: File.open(Rails.root + "app/assets/images/52a9a8b3c4b45.jpg"), category: fast_food)
Product.find_or_create_by(name: 'Hot dog', description: 'Best hot dog in the world', price: 5, stock: 15, image: File.open(Rails.root + "app/assets/images/hot-dog.jpg"), category: fast_food)
