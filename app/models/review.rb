class Review < ApplicationRecord
  belongs_to :user
  belongs_to :kart

  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 5 }

  # only one review should be allowed by a user
  validates :kart, uniqueness: { scope: :user }

  RATING = [1, 2, 3, 4]

end
