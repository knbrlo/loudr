class Album < ApplicationRecord

    belongs_to :creator
    has_many :users
    has_many :songs

    validates :name, :category, presence: true
    validates :name, length: { maximum: 50 }
    validates :category, length: { maximum: 50 }

    scope :edm_music, -> {where(category: "EDM")}

    def self.released_album_songs
        @songs = []
        self.where(released: true).each do |album|
            album.songs.each do |song|
                @songs << song
            end
        end
        @songs
    end
end
