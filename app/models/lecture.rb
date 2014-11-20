class Lecture < ActiveRecord::Base
  has_many :reviews
  validates :display_name, uniqueness: true
end
