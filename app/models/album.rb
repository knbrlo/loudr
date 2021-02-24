class Album < ApplicationRecord

    belongs_to :creator
    has_many :users
    has_many :songs

    validates :name, :category, presence: true
    validates :name, length: { maximum: 50 }
    validates :category, length: { maximum: 50 }

    scope :edm_music, -> {where(category: "EDM")}
end
