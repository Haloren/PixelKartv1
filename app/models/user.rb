class User < ApplicationRecord  
    has_many :reviews
    has_many :reviewed_karts, through: :reviews, source: :kart

    has_many :karts

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
