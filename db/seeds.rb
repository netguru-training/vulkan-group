#Users
User.create(name: 'Maria', email: 'maria@example.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Dominik', email: 'dominik@example.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Justyna', email: 'justyna@example.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Grzegorz', email: 'grzegorz@example.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Adam', email: 'adam@example.com', password: 'password', password_confirmation: 'password')

#Admin user
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

#Categories
Category.find_or_create_by(name: 'Vegetables')
Category.find_or_create_by(name: 'Fruits')
Category.find_or_create_by(name: 'Fast food')
