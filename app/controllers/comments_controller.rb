class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        #This will find my place as long as  it knows what the paramaters ":place_id" is.
        @place = Place.find(params[:place_id])
        @place.comments.create(comment_params.merge(user: current_user))
        #This will bring me back to the previous page I was on
        redirect_to place_path(@place)
    end
    
    private
    
    def comment_params #This is telling me what the parameters for "comment_params" is.
        params.require(:comment).permit(:message, :rating)
    end
end
