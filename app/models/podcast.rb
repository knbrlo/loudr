class Podcast < ApplicationRecord
    belongs_to :creator
    has_many :users
end
