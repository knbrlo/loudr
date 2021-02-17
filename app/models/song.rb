class Song < ApplicationRecord

    # relationships
    belongs_to :album

    # validations
    validates :name, :duration, :song_number, presence: true
    validates :name, length: { maximum: 50 }
    
end
