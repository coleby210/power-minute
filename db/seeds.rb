# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
	User.create(first_name: 'Admin', last_name: 'Admin', email: 'admin@power-minute.com', password: '12345678')

	User.create(first_name: 'Beni', last_name: 'Shpringer', email: 'bshpringer@gmail.com', password: '12345678')

	User.create(first_name: 'Ryan', last_name: 'Ho', email: 'ryan@power-minute.com', password: '12345678')

	User.create(first_name: 'Sean', last_name: 'From Iran', email: 'sean@power-minute.com', password: '12345678')

	User.create(first_name: 'Josh', last_name: 'Kim', email: 'josh@power-minute.com', password: '12345678')

	User.create(first_name: 'Cole', last_name: 'Kent', email: 'cole@power-minute.com', password: '12345678')


	Category.create(name: 'Power')
	Category.create(name: 'Cardio')
	Category.create(name: 'Yoga')

	20.times do 
		WorkoutTemplate.create(title: Faker::Company.name, description: Faker::Company.catch_phrase, creator_id: rand(2..6), category_id: rand(1..3))
	end

	100.times do
		Workout.create(user_id: rand(2..6), workout_template_id: rand(1..20), reps: rand(0..25))
	end

