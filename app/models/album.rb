class Album < ApplicationRecord

    # relationships
    belongs_to :creator
    has_many :users
    has_many :songs

    # validations
    validates :name, :category, presence: true
    validates :name, length: { maximum: 50 }
    validates :category, length: { maximum: 50 }

    # scope methods
    scope :edm_music, -> {where(category: "EDM")}


    # todo - create a migration to store images for each album

end
