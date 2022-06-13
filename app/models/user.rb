class User < ApplicationRecord
  has_secure_password
  has_many :cars
  mount_uploader :profile_picture, ImageUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
