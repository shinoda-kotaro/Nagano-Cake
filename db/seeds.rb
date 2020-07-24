# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'a@a', password: '123456')

5.times do |n|
  Genre.create!(
    name: "test#{n + 1}",
    is_effective: true
  )
end

5.times do |n|
  Item.create!(
    name: "cake#{n + 1}",
    genre_id: n+1,
    price: (n+1)*1000,
    is_sale: true,
    description: "evaluation #{n+1}"
  )
end