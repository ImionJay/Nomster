class Place < ApplicationRecord
    belongs_to :user #This place belongs to this user
    has_many :comments #This place can hold many comments
    has_many :photos #This place can display many pictures
    geocoded_by :address
    after_validation :geocode
    
    validates :name, presence: true
    validates :name, :length => { minimum:4 },:presence => true 
    #^This will create a new page for places when there are 4 different types of names.
    validates :address, :length => { minimum:4 },:presence => true 
    #^This will create a new page for places when there are 4 different types of places.
    validates :description, :presence => true
    
end
