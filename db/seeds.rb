# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
25.times do
Commerce.create(
    color: Faker::Commerce.color,
    department: Faker::Commerce.department,
    price: Faker::Commerce.price,
    promotion_code: Faker::Commerce.promotion_code,
    material: Faker::Commerce.material,
    brand: Faker::Commerce.brand,
    vendor: Faker::Commerce.vendor
)

end