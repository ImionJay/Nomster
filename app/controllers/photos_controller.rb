class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @photos = Photo.paginate(:page => params[:page], :per_page => 3)
    end
    
    def new
        @photo = Photo.new
    end
    
    def create
      @place = Place.find(params[:place_id])
      #^This is going to find the place with the right paramaters
        @place.photos.create(photo_params)
        #^This is going to create a photo using the parameters
            redirect_to place_path(@place)
            #^ This puts us back on the previous page
    end
    
    def show #This will show the photo after it finds the right parameters
        @photos = Photo.find(params[:id])
    end
    
    def edit
        @photo = Photo.find(params[:id])
        
        if @photo.user != current_user #If the owner of the photo is the user that is logged in they can edit the photo.
            return render text: 'Not Allowed', status: :forbidden
        end
    end
    
    def update #This updates the page with my new photo as long as it meets the requirements, otherwise it will fail.
        @photo = Photo.find(params[:id])
        
            if @photo.user != current_user 
                return render text: 'Not Allowed', status: :forbidden
            end
            
        @photo.update_attributes(photo_params)
        if @photo.valid?
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy #This will destroy the photo as long as the photo meets the set parameter
        @photo = Photo.find(params[:id])
            if @photo.user != current_user
                return render text: 'Not Allowed', status: :forbidden
            end
        @photo.destroy
        redirect_to root_path
    end
    
    private
    
    def photo_params #The parameters require a photo and when it gets the photo it permits the program to display a caption and the picture.
        params.require(:photo).permit(:caption, :picture)
    end

end
