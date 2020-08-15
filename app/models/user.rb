class User < ApplicationRecord
    has_many :reviews
    has_many :karts, through: :reviews

    has_many :karts
end
