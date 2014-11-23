class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @average_rating = average_rating(@user, false)
    @average_given_rating = average_rating(@user, true)
  end

  def average_rating(user, given)
  	if given
  	  reviews = Review.where(reviewer: @user).select('rating')
  	else
  	  reviews = Review.where(person_reviewed: @user).select('rating')
  	end
  	if reviews.length == 0
  	  return ''
  	end
  	arr = Array.new
  	for i in 0..(reviews.count - 1)
      arr.append(reviews[i]['rating'])
    end
    average_rating = arr.inject{ |sum, el| sum + el }.to_f / arr.size
    return average_rating.to_s[0..2]
  end

end
