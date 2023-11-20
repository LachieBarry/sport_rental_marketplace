class Listing < ApplicationRecord
  # belongs_to :user
  # need to implment photos too at some point
  valid_sports = ['AFL', 'Gridiron', 'Rugby', 'Netball', 'Cricket', 'Baseball', 'Basketball', 'Softball', 'Golf', 'Tennis', 'Frisbee', 'Volleyball', 'Cycling', 'BMX', 'Martial Arts', 'Gymnastics', 'Curling', 'Ice Skating', 'Ice Hockey', 'Field Hockey', 'Skateboarding', 'Snowboarding', 'Skiing', 'Surfing', 'Sledding', 'Rowing', 'Water Polo', 'Kickball', 'Dodgeball', 'Lacrosse', 'Rollerskating', 'Handball', 'Dodgeball', 'Hurling', 'Polo', 'Badmitton', 'Squash', 'Table Tennis', 'Other']

  validates :title, :description, :sport_type, :hourly_price, presence: true
  validates :title, length: { minimum: 2 }
  validates :description, length: { maximum: 300 }
  validates :hourly_price, numericality: true
  validates :sport_type, inclusion: { in: valid_sports, message: 'Invalid sport type.' }
end
# Listing.create!(title: "Sherrin Footy", sport_type: "AFL", description: "Well-loved Sherrin Footy, pumped it the other day", hourly_price: 1)
