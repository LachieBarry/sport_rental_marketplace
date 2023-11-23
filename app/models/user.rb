class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :listings

  validates :first_name, :last_name, :phone_number, presence: true
  validates :phone_number, numericality: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
