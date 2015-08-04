# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
School.delete_all
Proposal.delete_all
User.delete_all
Message.delete_all

volunteer = User.create! username: "volunteer", email: "volunteer@user.com", password: "password", password_confirmation: "password", category: "volunteer", name: "Maria", location: "Anchorage"

school_user = User.create! username: "school", email: "school@user.com", password: "password", password_confirmation: "password", category: "school", name: "South Anchorage High School", location: "Anchorage"

proposal = Proposal.create! topic: "math", duration: "1 hour", target_age: "12", language: "Spanish", user: volunteer,
description: "A fun introduction to fractals!"

school = School.create! school_name: "South Anchorage High School", location: "10471 Honey Bear Lane, Anchorage, Alaska", needs: "Spanish Teacher", students_age: "15-18", user: school_user

Message.create! sender_id: volunteer.id, title: "Fractals class", body: "Hi! I'm a first time teacher interested in teaching a class on fractals at your school.",
receiver_id: school_user.id, read: true

