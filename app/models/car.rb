class Car < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :model, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :image, presence: true
end
