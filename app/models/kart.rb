class Kart < ApplicationRecord
  belongs_to :garage
  belongs_to :user

  has_many :reviews
  has_many :users, through: :reviews

  DRIVERS = ['Driver1', 'Driver2']
  COLORS = ['Red', 'Blue', 'Purple']
  BODIES = ['Body1', 'Body2']
  WHEELS = ['Wheels1', 'Wheels2']

end
