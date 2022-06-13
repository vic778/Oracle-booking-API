class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :car_id, presence: true, uniqueness: true
end
