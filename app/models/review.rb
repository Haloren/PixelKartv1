class Review < ApplicationRecord
  belongs_to :user
  belongs_to :kart

  validate :rating, presence: true

  RATING = ['1','2','3','4']
end
