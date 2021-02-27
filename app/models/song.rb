class Song < ApplicationRecord
    belongs_to :album
    validates :name, :duration, :song_number, presence: true
    validates :name, length: { maximum: 50 }
end
