# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email


# Make Reviews
%w(Apple Banana Carrot Date).each do |reviewer|
  Review.create reviewer: reviewer, rating: 5, description: "Great partner!",
  person_being_reviewed: "Ryan@berkeley.edu", lecture_id: 2
end

# Make Users
%w(Ryan Jenna Daniel Steffan).each do |name|
  User.create name: name, email: name+"@berkeley.edu"
end

# Make Lectures
%w(Algorithms Rails Music Operating\ Systems).each do |name|
  Lecture.create name: name, semester: "Fall", year: 2014, display_name: name + " Fall 2014"
end
