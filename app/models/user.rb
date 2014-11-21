class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :given_reviews, class_name: "Review", foreign_key: "reviewer_id"
  has_many :received_reviews, class_name: "Review", foreign_key: "person_reviewed_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
