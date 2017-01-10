# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "create account admin"

account = Account.new username:'admin',
                          password:'a123456',
                          password_confirmation:'a123456',
                          role:'admin'
account.save!(validate:false)