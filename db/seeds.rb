# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 2.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   domain = Faker::Internet.domain_name
#   email = Faker::Internet.email(
#     name: "#{first_name} #{last_name}",
#     separators: '_',
#     domain: domain)
#   User.create!(first_name: first_name, last_name: last_name, email: email, password: 'password')
# end

require 'active_support/inflector'
# 100.times do
#   Gift.create!(title: Faker::Commerce.product_name)
# end
require 'open-uri'
require 'json'

puts "Creating Gifts"

etsy_api = JSON.parse(open("https://openapi.etsy.com/v2/listings/active?limit=100&offset=0&currency_code=GBP&api_key=lb0tia9t2gxo8956aapcdi9g").read)
etsy_listings = etsy_api["results"]
etsy_listings.each do |l|
  image_api = JSON.parse(open("https://openapi.etsy.com/v2/listings/#{l["listing_id"]}/images?api_key=lb0tia9t2gxo8956aapcdi9g").read)
  image_listings = image_api["results"]
  gift = Gift.create(
    title: l["title"].match(/[^-*([{],.\n\|\/]+/).to_s.gsub("&quot", "").gsub("&#39;", "").gsub("4&Quot;", "").gsub("X2&Quot;", "").titleize,
    description: l["description"].match(/([^\n]+)/).to_s.gsub("&quot", "").gsub("&#39;", "").gsub("4&Quot;", "").gsub("X2&Quot;", "").capitalize,
    link: l["url"],
    image: image_listings[0]["url_570xN"],
    price: l["price"],
    main_category: l["taxonomy_path"].first,
    sub_category: l["taxonomy_path"].last,
    )
  puts "Gift #{gift.id} has been created"
end

puts "Done"
