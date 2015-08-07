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

volunteer_user = User.create! username: "volunteer", email: "volunteer@user.com", password: "password", password_confirmation: "password", category: "volunteer", 
name: "Maria", location: "Anchorage", photo: File.new("public/images/maria.jpg")
volunteer= User.create! username: "ndney", email: "n@user.com", password: "password", password_confirmation: "password", category: "volunteer", name: "Nadin", location: "19 Park Rd, Cape Town, South Africa",
photo: File.new("public/images/nadin.jpg")
school_user = User.create! username: "school", email: "school@user.com", password: "password", password_confirmation: "password", category: "school", name: "Sam McKay", location: "Cape Town",
photo: File.new("public/images/school1.jpg")
school_user_2 = User.create! username: "bobj", email: "bob@user.com", password: "password", password_confirmation: "password", category: "school", name: "Bob Jones", location: "Anchorage",
photo: File.new("public/images/principal.jpg")



proposal = Proposal.create! topic: "Math", duration: "1 hour", target_age: "14", language: "Spanish", user: volunteer,
description: "The math behind knots and other topography!"
proposal_2 = Proposal.create! topic: "Computer Skills", duration: "2 hours", target_age: "8", language: "English", user: volunteer_user,
description: "Basic intro to word and typing. Also a quick simulation of coding with blocks."
proposal_3 = Proposal.create! topic: "Psychology", duration: "45 minutes", target_age: "16-18", language: "French", user: volunteer_user, 
description: "The psychology of modern use of social media and other networks."

Message.create! sender_id: volunteer.id, title: "Knots class", body: "Hi! I'm a first time teacher interested in teaching a class on fractals at your school.",
receiver_id: school_user.id, read: true
Message.create! sender_id: school_user.id, title: "Awesome!", body: "Sounds great! What school and what day works for you?",
receiver_id: volunteer.id, read: false
Message.create! sender_id: school_user.id, title: "Psych class!", body:"Your psych class sounds amazing, would be a cool class for our students interested in teaching?",
receiver_id: volunteer_user.id, read: false

school = School.create! school_name: "South Anchorage High School", location: "10471 Honey Bear Lane, Anchorage, Alaska", needs: "Spanish Teacher", students_age: "15-18", user: school_user_2
School.create! school_name: "Sobambisana Public Primary School", location: "T616 Site B, Banciso Drive, Khayelitsha, Western Cape, South Africa", 
needs: "Computer class, Economics teacher", students_age: "", user: school_user
School.create! school_name: "Masithandane Primary School", location: "Village 3 North, Cape Town, South Africa", needs: "Computer teacher, English teacher", students_age: "6-12",
user: school_user

school.proposals << proposal_3
school.save!




