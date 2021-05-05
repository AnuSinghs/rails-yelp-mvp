# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'pry-byebug'
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'destroy old data'

Restaurant.destroy_all

require 'faker'

10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.subscriber_number,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  )
  restaurant.save

  (5..10).to_a.sample.times do
    review = Review.new(
      content: Faker::TvShows::Friends.quote,
      rating: (0..5).to_a.sample,
      restaurant: Restaurant.last
    )
    review.save
  end
end
