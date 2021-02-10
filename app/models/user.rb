class User < ApplicationRecord

    # this is taking care of password validations
    has_secure_password

    # more validations for user attributes
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
