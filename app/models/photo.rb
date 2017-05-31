class Photo < ApplicationRecord
    belongs_to :user
    has_many :photos
end

# One place can have many photos, but photos can't have many places.