# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
"""user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email"""

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

all_users = User.all

for i in 0..all_users.size
  @r = Review.new
  @r.reviewer = all_users[i % all_users.size]
  @r.person_reviewed = all_users[(i + 1) % all_users.size]
  @r.rating = 5
  @r.description = "Very good partner!"
  @r.lecture = Lecture.first
  @r.save
end

@r = Review.new
@r.reviewer = User.first
@r.person_reviewed = User.last
@r.rating = 0
@r.description = "I'd like to see what happens to the view with alonger description - one which occupies more than one line. So here goes. Steffan was really a very poor partner to work with. I worked with him on a Rails project, and he did literally none of the work. He didn't set up any models, didn't make any db seeds, didn't get any of the devise stuff or front-end working. He's really a dweeb."
@r.lecture = Lecture.first
@r.save