class Album < ApplicationRecord

    # relationships
    belongs_to :creator
    has_many :users
    has_many :songs

    # validations


    # todo - create a migration to store images for each album

end
