class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
    @reviewer = User.find(@review.reviewer_id)
    @person_being_reviewed = User.find(@review.person_reviewed_id)
  end

  def new
    @users = User.all
    @lectures = Lecture.all
  end

  def create
    @review = Review.new(review_params)
    name = @review.person_being_reviewed
    @person_reviewed = User.where(name: name).first
    @review.person_reviewed_id = @person_reviewed.id

    lecture = @review.lecture_name
    @lectue_reviewed = Lecture.where(display_name: lecture).first
    @review.lecture_id = @lectue_reviewed.id

    @review.reviewer_id = current_user[:id]
    @review.save
    if not @review.errors.full_messages.empty?
      flash[:error] = @review.errors.full_messages.to_sentence
      redirect_to new_review_path
    else
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :person_being_reviewed, :lecture_name)
  end



end
