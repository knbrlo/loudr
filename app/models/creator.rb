class Creator < ApplicationRecord

    # this is taking care of password validations
    has_secure_password

    # more validations for user attributes
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

    # todo - optional add the ability to store an image in sqlite for creators
    # https://www.google.com/search?sxsrf=ALeKk00e4CKI-_BGrpKZx1Ov3y1Ga_ix4Q%3A1612993916885&ei=fFUkYJaeNYPrtQa45JugDg&q=ruby+store+image+in+sqlite&oq=ruby+store+image+in+sqlite&gs_lcp=CgZwc3ktYWIQAzoHCCMQsAMQJzoHCAAQRxCwAzoICAAQCBAHEB46BQgAEM0CUJctWO4wYIwyaAJwAngAgAHcAYgB6gSSAQU1LjAuMZgBAKABAaoBB2d3cy13aXrIAQnAAQE&sclient=psy-ab&ved=0ahUKEwiWzMLLpuDuAhWDdc0KHTjyBuQQ4dUDCA0&uact=5

end