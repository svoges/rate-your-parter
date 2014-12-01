class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_reviews = Review.where(person_reviewed_id: @user.id)
  end
end
