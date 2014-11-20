class Lecture < ActiveRecord::Base
  has_many :reviews
  validates :display_name, presence: true, uniqueness: true
  validates :year, numericality: {less_than: 2015}, presence: true
  validates :semester, inclusion: { in: %w(Fall Spring Summer),
    message: "Semester must be Fall, Spring or Summer" }, allow_nil: false
end
