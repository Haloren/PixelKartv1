class Review < ApplicationRecord
  belongs_to :user
  belongs_to :kart

  validates :rating, presence: true

  RATING = [1, 2, 3, 4]
end
