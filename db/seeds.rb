# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Make Users
%w(Ryan Jenna Daniel Steffan).each do |name|
  User.create name: name, email: name+"@berkeley.edu"
  puts "created user: " + name
end

# Make Reviews
%w(Apple Banana).each do |reviewer|
  Review.create reviewer: reviewer, rating: 5, description: "Great partner!",
  reviewer_id:1, person_reviewed_id: 1, lecture_id: 2
end
%w(Carrot Date).each do |reviewer|
  Review.create reviewer: reviewer, rating: 5, description: "Great partner!",
  reviewer_id:3, person_reviewed_id: 3, lecture_id: 3
end

# Make Lectures
%w(Algorithms Rails Music Operating\ Systems).each do |name|
  Lecture.create name: name, semester: "Fall", year: 2014, display_name: name + " Fall 2014"
end
