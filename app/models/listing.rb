class Listing < ApplicationRecord
  # active storage
  has_one_attached :photo
  # bookings
  has_many :bookings, dependent: :destroy
  belongs_to :user
  # geocoder gem
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  # sports type
  valid_sports = ['AFL', 'Gridiron', 'Rugby', 'Netball', 'Cricket', 'Baseball', 'Basketball', 'Softball', 'Golf', 'Tennis', 'Frisbee', 'Volleyball', 'Cycling', 'BMX', 'Martial Arts', 'Gymnastics', 'Curling', 'Ice Skating', 'Ice Hockey', 'Field Hockey', 'Skateboarding', 'Snowboarding', 'Skiing', 'Surfing', 'Sledding', 'Rowing', 'Water Polo', 'Kickball', 'Dodgeball', 'Lacrosse', 'Rollerskating', 'Handball', 'Dodgeball', 'Hurling', 'Polo', 'Badmitton', 'Squash', 'Table Tennis', 'Other']
  # validations
  validates :title, :description, :sport_type, :hourly_price, :photo, presence: true
  validates :title, length: { minimum: 2 }
  validates :description, length: { maximum: 300 }
  validates :hourly_price, numericality: true
  validates :sport_type, inclusion: { in: valid_sports, message: 'Invalid sport type.' }
end
