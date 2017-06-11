class Comment < ApplicationRecord
    belongs_to :user #The comment is in a one-to-one connection with the user
    belongs_to :place #The comment is in a one-to-one connection with the place
    after_create :send_comment_email #After creation this will send an email about a person leaving a comment.
    
    
    RATINGS = {
        'one star': '1_star',
        'two stars': '2_stars',
        'three stars': '3_stars',
        'four stars': '4_stars',
        'five stars': '5_stars'
    }
    
    def humanized_rating
        RATINGS.invert[self.rating]
    end
    
    def send_comment_email #This tells what "send_comment_email" does when it is called
        NotificationMailer.comment_added(self).deliver
    end
end
