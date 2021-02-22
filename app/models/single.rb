class Single < ApplicationRecord

    # relationships
    belongs_to :creator
    has_many :users

    # todo - validations

    # todo - scope methods
    
end
