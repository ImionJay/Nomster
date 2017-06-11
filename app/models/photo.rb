class Photo < ApplicationRecord
    belongs_to :user #This tells me that the photo belongs to a user
    belongs_to :place #This tells me that a photo is connected to a place.
    
    mount_uploader :picture, PictureUploader
end

# One place can have many photos, but photos can't have many places.