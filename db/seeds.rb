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
require 'faker'

puts "Cleaning database"
Listing.destroy_all
User.destroy_all

puts "Creating users"
10.times do
  # Retrieve the user
  User.create(
    email: Faker::Name.first_name + ["@gmail.com", "@hotmail.com", "@yahoo.com"].sample,
    password: '123456', # Ensure your password has at least 6 characters
    password_confirmation: '123456',
    first_name: ["Jonesy", "Jimmy", "John", "Shazza"].sample,
    last_name: ["Jones", "Johns", "Jim", "Gazza"].sample,
    phone_number: '04213456789' # Assuming a numeric phone number
  )
end

User.create(
  email: "test@test.com",
  password: '123456', # Ensure your password has at least 6 characters
  password_confirmation: '123456',
  first_name: ["Jonesy", "Jimmy", "John", "Shazza"].sample,
  last_name: ["Jones", "Johns", "Jim", "Gazza"].sample,
  phone_number: '04213456789' # Assuming a numeric phone number
)
puts 'user created successfully.'

# reference to the image
file1 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791686/Batmitton-Racquet_xkfk0g.jpg")
file2 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791686/Cricket-Bat_w7mq9x.jpg")
file3 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791686/Rugbyball_vbhae0.jpg")
file4 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791686/gridiron-gloves_hyt6si.jpg")
file5 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791686/netball-Jersey_pzjrg6.jpg")
file6 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791686/Martial-Arts-Gi_w8y52q.jpg")
file7 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791686/Cricket-Ball_lpm0or.jpg")
file8 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791685/Curling-Broom_iiqtfo.jpg")
file9 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700791685/Baseball-bat_hteyid.jpg")
file10 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1700721946/development/qmmeq33gdfm6p4d9g233h4w63wgm.jpg")

# this is a Sample listing

listing2 = Listing.new(
  title: 'Cricket Bat', # Ensure this is a valid title
  sport_type: 'Cricket', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 10,
  user: User.all.sample

)
listing2.photo.attach(io: file2, filename: 'cricket.jpg', content_type: 'image/jpg')
listing2.save!

listing3 = Listing.new(
  title: 'Rugby Ball', # Ensure this is a valid title
  sport_type: 'Rugby', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 10,
  user: User.all.sample

)
listing3.photo.attach(io: file3, filename: 'rugby.jpg', content_type: 'image/jpg')
listing3.save!

listing4 = Listing.new(
  title: 'Grid Iron Gloves ', # Ensure this is a valid title
  sport_type: 'Gridiron', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 10,
  user: User.all.sample

)
listing4.photo.attach(io: file4, filename: 'gridiron-glove.jpg', content_type: 'image/jpg')
listing4.save!

listing5 = Listing.new(
  title: 'Netball Jersey', # Ensure this is a valid title
  sport_type: 'Netball', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 15,
  user: User.all.sample

)
listing5.photo.attach(io: file5, filename: 'Netball.jpg', content_type: 'image/jpg')
listing5.save!

listing6 = Listing.new(
  title: 'Martial Arts Gi', # Ensure this is a valid title
  sport_type: 'Martial Arts', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 10,
  user: User.all.sample
)
listing6.photo.attach(io: file6, filename: 'MartialArts.jpg', content_type: 'image/jpg')
listing6.save!

listing7 = Listing.new(
  title: 'Cricket Ball', # Ensure this is a valid title
  sport_type: 'Cricket', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 5,
  user: User.all.sample

)
listing7.photo.attach(io: file7, filename: 'Cricketball.jpg', content_type: 'image/jpg')
listing7.save!

listing8 = Listing.new(
  title: 'Curling Broom', # Ensure this is a valid title
  sport_type: 'Curling', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 30,
  user: User.all.sample

)
listing8.photo.attach(io: file8, filename: 'rugby.jpg', content_type: 'image/jpg')
listing8.save!

listing9 = Listing.new(
  title: 'Baseball Bat', # Ensure this is a valid title
  sport_type: 'Baseball', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 10,
  user: User.all.sample

)
listing9.photo.attach(io: file9, filename: 'rugby.jpg', content_type: 'image/jpg')
listing9.save!

listing10 = Listing.new(
  title: 'AFL Ball', # Ensure this is a valid title
  sport_type: 'AFL', # Ensure this is a valid sport type
  description: "Big game on saturday.", # Ensure this is a valid description
  hourly_price: 5,
  user: User.all.sample

)
listing10.photo.attach(io: file10, filename: 'footy.jpg', content_type: 'image/jpg')
listing10.save!

puts 'Listing created successfully.'
