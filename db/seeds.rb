# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

restaurants = Restaurant.create!([
  { name: 'Sushi Samba', address: '1 Sushi St, Tokyo', phone_number: '123-456-7890', category: 'japanese' },
  { name: 'La Petite Maison', address: '5 French Ave, Paris', phone_number: '987-654-3210', category: 'french' },
  { name: 'Pasta Palace', address: '12 Pasta Rd, Rome', phone_number: '456-789-0123', category: 'italian' },
  { name: 'Great Wall Diner', address: '8 China Town, Beijing', phone_number: '321-654-0987', category: 'chinese' },
  { name: 'Brussels Bites', address: '3 Waffle Square, Brussels', phone_number: '654-321-7890', category: 'belgian' }
])

puts 'Creating reviews...'

restaurants.each do |restaurant|
  rand(2..5).times do
    Review.create!(
      restaurant: restaurant,
      content: ['Amazing food!', 'Will come again.', 'Not bad at all.', 'Could be better.', 'Excellent service!']
      .sample, rating: rand(0..5)
    )
  end
end

puts 'Seeding done!'
