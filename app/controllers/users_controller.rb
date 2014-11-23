class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    users_given_reviews = Review.where(reviewer: @user).select('rating')
    arr = Array.new
    for i in 0..(users_given_reviews.count - 1)
      arr.append(users_given_reviews[i]['rating'])
    end
    puts 'got here'
    @average_given_rating = arr.inject{ |sum, el| sum + el }.to_f / arr.size
    if @average_given_rating.to_s.length > 1
      @average_given_rating = @average_given_rating.to_s[0..2]
    else
      @average_given_rating = @average_given_rating.to_s
    end
  end

end
