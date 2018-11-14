# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# end
CatRentalRequest.destroy_all
Cat.destroy_all

10.times do |cat|

cat = Cat.create!(birth_date: Faker::Date.backward(2000), color: Cat::CAT_COLORS.sample,name: Faker::Pokemon.name, sex: ["M","F"].sample, description: Faker::ChuckNorris.fact)

  rand(5).times do |request|

    CatRentalRequest.create!(cat_id: cat.id, end_date: Faker::Date.between(3.days.from_now, 14.days.from_now) , start_date: Faker::Date.forward(2), status: "PENDING")

  end
end