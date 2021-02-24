class Creator < ApplicationRecord

    has_many :singles
    has_many :users, through: :singles
    has_many :albums
    has_many :users, through: :albums
    has_many :podcasts
    has_many :users, through: :podcasts

    has_secure_password
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
