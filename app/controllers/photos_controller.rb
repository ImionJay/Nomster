class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @photos = Photo.paginate(:page => params[:page], :per_page => 3)
    end
    
    def new
        @photo = Photo.new
    end
    
    def create
       @place = current_user.places.create(params[:page])
        redirect_to place_path(:photo_params)
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
        params.require(:photo).permit(:caption, :picture)
    end

end
