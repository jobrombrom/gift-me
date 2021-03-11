# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'


puts "Creating Gifts"
api_key = ENV['ETSY_API_KEY']

etsy_url = "https://openapi.etsy.com/v2/listings/active?api_key=#{api_key}"
etsy_api = HTTParty.get(etsy_url)
etsy_hash = JSON.parse(etsy_api.response.body)
etsy_listings = etsy_hash["results"]

etsy_listings.each do |l|
  image_url = "https://openapi.etsy.com/v2/listings/#{l["listing_id"]}/images?api_key=#{api_key}"
  image_api = HTTParty.get(image_url)
  image_hash = JSON.parse(image_api.response.body)
  image_listings = image_hash["results"]

  gift = Gift.new(
    title: l["title"].capitalize,
    description: l["description"],
    link: l["url"],
    image: image_listings[0]["url_570xN"],
    price: l["price"],
    main_category: l["taxonomy_path"].first,
    sub_category: l["taxonomy_path"].last,
    )
  gift.save
end

puts "Done"
