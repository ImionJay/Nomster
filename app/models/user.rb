class User < ApplicationRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :places
  has_many :comments
  
  mount_uploader :Picture, PictureUploader
end
