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


# 100.times do
#   Gift.create!(title: Faker::Commerce.product_name)
# end
require 'open-uri'
require 'json'

etsy_api = JSON.parse(open("https://openapi.etsy.com/v2/listings/active?limit=10&offset=0&currency_code=GBP&api_key=lb0tia9t2gxo8956aapcdi9g").read)
etsy_listings = etsy_api["results"]
etsy_listings.each_with_index do |l, index|
  image_api = JSON.parse(open("https://openapi.etsy.com/v2/listings/#{l["listing_id"]}/images?api_key=lb0tia9t2gxo8956aapcdi9g").read)
  image_listing = image_api["results"]
  puts "---------"
  puts "#{index + 1}. Title: #{l["title"].capitalize}"
  puts "Description: #{l["description"]}"
  puts "Link: #{l["url"]}"
  puts "Image: #{image_listing[0]["url_570xN"]}"
  puts "Price: £#{l["price"]}."
  puts "Main Category: #{l["taxonomy_path"].first}"
  puts "Sub Category: #{l["taxonomy_path"].last}"
  puts "---------"
end
