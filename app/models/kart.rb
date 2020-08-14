class Kart < ApplicationRecord
  belongs_to :garage
  belongs_to :user
end
