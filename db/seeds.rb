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
  @u = User.new
  @u.email = name+"@berkeley.edu"
  @u.name = name
  @u.password = "berkeley"
  puts @u.valid?
  puts @u.save
  puts @u.errors.messages
  puts "created user: " + name
end

%w(Algorithms OS AI).each do |name|
  @l = Lecture.new
  @l.name = name
  @l.semester = "Fall"
  @l.year = 2014
  @l.display_name = @l.name + " " + @l.semester + " " + @l.year.to_s
  puts @l.valid?
  puts @l.save
  puts @l.errors.messages
  puts "created lecture: " + name
end

Review.create reviewer: User.first, rating: 5, description: "Great partner!", lecture: Lecture.first, person_reviewed: User.second

'''
# Make Reviews
%w(Apple Banana).each do |reviewer|
  Review.create reviewer: reviewer, rating: 5, description: "Great partner!",
  reviewer_id:2, person_reviewed_id: 3, lecture_id: 2
end
%w(Carrot Date).each do |reviewer|
  Review.create reviewer: reviewer, rating: 5, description: "Great partner!",
  reviewer_id:4, person_reviewed_id: 5, lecture_id: 3
end

# Make Lectures
%w(Algorithms Rails Music Operating\ Systems).each do |name|
  Lecture.create name: name, semester: "Fall", year: 2014, display_name: name + " Fall 2014"
end
'''