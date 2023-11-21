class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :start_date, :end_date, :accepted, :total_price, presence: true
  validates :total_price, numericality: true
end
