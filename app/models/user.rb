class User < ApplicationRecord

    has_many :singles
    has_many :creators, through: :singles
    has_many :albums
    has_many :creators, through: :albums
    has_many :podcasts
    has_many :creators, through: :podcasts

    has_secure_password
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
end
