# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

volunteer = User.create! username: "volunteer", email: "volunteer@user.com", password: "password", password_confirmation: "password", category: "volunteer"
school = User.create! username: "school", email: "school@user.com", password: "password", password_confirmation: "password", category: "school"

proposal = Proposal.create! teacher_name: "Nadin Ey", teacher_location: "Mexico City", topic: "math", duration: "1 hour", target_age: "12", language: "Spanish", user_id: volunteer

school = School.create! school_name: "South Anchorage High School", location: "Anchorage", needs: "Spanish Teacher", students_age: "15-18", user_id: school