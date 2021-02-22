class Song < ApplicationRecord

    # relationships
    belongs_to :album

    # validations
    # todo - look into modules for sharing validations between models
    validates :name, :duration, :song_number, presence: true
    validates :name, length: { maximum: 50 }
    
end
