class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :places #This means there are many places that the user can upload
  has_many :comments #This means that there are many comments that the user can leave on the page
  has_many :photos #This means that the user can upload many photos to the website
  
  mount_uploader :picture, PictureUploader
end
