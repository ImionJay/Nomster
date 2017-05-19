class Place < ApplicationRecord
    belongs_to :user
    validates :name, :length => { minimum:4 },:presence => true
    validates :address, :length => { minimum:4 },:presence => true
    validates :description, :presence => true
    
end
