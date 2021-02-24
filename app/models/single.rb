class Single < ApplicationRecord
    belongs_to :creator
    has_many :users
end
