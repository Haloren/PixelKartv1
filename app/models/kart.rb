class Kart < ApplicationRecord
  belongs_to :garage
  belongs_to :user

  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :garage

  def garage_attributes=(attributes)
    self.garage = Garage.find_or_create_by(attributes) if !attributes['name'].empty?
    self.garage
  end

  validates :name, presence: true, uniqueness: true
  validates :driver, presence: true
  validates :color, presence: true
  validates :body, presence: true
  validates :wheels, presence: true

  DRIVERS = ['Driver1', 'Driver2']
  COLORS = ['Red', 'Blue', 'Purple']
  BODIES = ['Body1', 'Body2']
  WHEELS = ['Wheels1', 'Wheels2']

  scope :avg_rating, -> { left_joins(:reviews).group(:id).order("avg(rating) desc") }

end
