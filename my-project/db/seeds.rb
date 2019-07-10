# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'
require 'json'
require 'pry'

Product.destroy_all

    url = "http://makeup-api.herokuapp.com/api/v1/products.json"

    response = RestClient.get(url)
    data = JSON.parse(response.body)
# puts "RESPONSE -  " + response
# puts "DATA --  " + data

 data.map do |h|
    brand = h["brand"]
    name = h["name"]
    price = h["price"]
    image_link = h["image_link"]
    product_link = h["product_link"]

Product.create(brand: brand,
  name: name,
  price: price,
  image_link: image_link,
  product_link: product_link
)
puts "~ ~ Saved " + name
  end
