# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Proposal.delete_all
School.delete_all

volunteer = User.create! username: "volunteer", email: "volunteer@user.com", password: "password", password_confirmation: "password", category: "volunteer"
school = User.create! username: "school", email: "school@user.com", password: "password", password_confirmation: "password", category: "school"

proposal = Proposal.create! topic: "math", duration: "1 hour", target_age: "12", language: "Spanish", user: volunteer,
description: "A fun introduction to fractals!"

school = School.create! school_name: "South Anchorage High School", location: "Anchorage", needs: "Spanish Teacher", students_age: "15-18", user: school