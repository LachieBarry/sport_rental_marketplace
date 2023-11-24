# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'cloudinary'
require 'open-uri'
# Cloudinary.config do |config|
#   config.cloud_name = 'your_cloud_name'
#   config.api_key = 'your_api_key'
#   config.api_secret = 'your_api_secret'
# end

# # Upload a sample image to Cloudinary
# uploaded_file = Cloudinary::Uploader.upload('qmmeq33gdfm6p4d9g233h4w63wgm', options = {})

User.create!(
  email: 'jimmyj@gmail.com',
  password: '123456', # Ensure your password has at least 6 characters
  password_confirmation: '123456',
  first_name: 'Jimmy',
  last_name: 'Jones',
  phone_number: '04213456789' # Assuming a numeric phone number
)

puts 'user created successfully.'

# Retrieve the user
user = User.find_by(email: 'jimmyj@gmail.com')
# refernce to the image
file = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700721946/development/qmmeq33gdfm6p4d9g233h4w63wgm.jpg")

listing = Listing.new(
  title: 'Jimmy\'s Big Game', # Ensure this is a valid title
  sport_type: 'AFL', # Ensure this is a valid sport type
  description: 'Jimmy\'s big footy game on saturday.', # Ensure this is a valid description
  hourly_price: 20,
  user: user,
  address: 'Punt Rd, East Melbourne VIC 3002',
  latitude: -37.8214241,
  longitude: 144.9876872
)
# Attach the image to the listing
listing.photo.attach(io: file, filename: 'football.jpg', content_type: 'image/jpg')
# Save the listing
listing.save!
puts 'Listing created successfully.'
