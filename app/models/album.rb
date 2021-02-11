class Album < ApplicationRecord

    # relationships
    belongs_to :creator
    belongs_to :user

    has_many :songs
    
    # validations


    # todo - create a migration to store images for each album

end
