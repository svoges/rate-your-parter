class ReviewsController < ApplicationController

def show
  @review = Review.find(params[:id])
  @reviewer = User.find(@review.reviewer_id)
  @person_being_reviewed = User.find(@review.person_reviewed_id)
end

end
