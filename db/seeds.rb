# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  domain = Faker::Internet.domain_name
  email = Faker::Internet.email(
    name: "#{first_name} #{last_name}",
    separators: '_',
    domain: domain)
  User.create!(first_name: first_name, last_name: last_name, email: email, password: 'password')
end


10.times do
  # added unique so different products when seeding
  Gift.create!(title: Faker::Commerce.unique.product_name)
end
