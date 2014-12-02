class Review < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :reviewer, class_name: "User"
  belongs_to :person_reviewed, class_name: "User"
  validates :rating, presence: true, length: {minimum: 0, maximum: 5}
  validates :description, presence: true, length: {maximum: 500} # maximum 500 chars
end
