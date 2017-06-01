class Place < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :photos
    geocoded_by :address
    after_validation :geocode
    
    validates :name, presence: true
    validates :name, :length => { minimum:4 },:presence => true
    validates :address, :length => { minimum:4 },:presence => true
    validates :description, :presence => true
    
end
