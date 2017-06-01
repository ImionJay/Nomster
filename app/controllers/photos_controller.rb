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
            @place.photos.create
        redirect_to place_path(@place)
    end
    
    def show
        @photos = Photo.find(params[:id])
    end
    
    def edit
        @photo = Photo.find(params[:id])
        
        if @photo.user != current_user
            return render text: 'Not Allowed', status: :forbidden
        end
    end
    
    def update
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
    
    def destroy
        @photo = Photo.find(params[:id])
            if @photo.user != current_user
                return render text: 'Not Allowed', status: :forbidden
            end
        @photo.destroy
        redirect_to root_path
    end
    
    private
    
    def photo_params
        params.require(:photo).permit(:name, :description, :address)
    end

end
