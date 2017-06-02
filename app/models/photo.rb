class Photo < ApplicationRecord
    belongs_to :user
    belongs_to :place
    
    mount_uploader :picture, PictureUploader
end

# One place can have many photos, but photos can't have many places.