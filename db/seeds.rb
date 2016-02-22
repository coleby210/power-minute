# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	User.create(first_name: 'Admin',last_name: "Admin", timezone: "-8", email: 'admin@power-minute.com', password: '12345678')

	User.create(first_name: 'Beni',last_name: "Shpringer", timezone: "-8", email: 'bshpringer@gmail.com', password: '12345678')

	User.create(first_name: 'Ryan', last_name: "Ho", timezone: "-8", email: 'ryan@power-minute.com', password: '12345678')

	User.create(first_name: 'Sean', last_name: "From Iran", timezone: "-8", email: 'sean@power-minute.com', password: '12345678')

	User.create(first_name: 'Josh', last_name: "Kim", timezone: "-8", email: 'josh@power-minute.com', password: '12345678')

	User.create(first_name: 'Cole', last_name: "Kent", timezone: "-6", email: 'cole@power-minute.com', password: '12345678')


	Category.create(name: 'Power')
	Category.create(name: 'Cardio')
	Category.create(name: 'Yoga')

	20.times do
		WorkoutTemplate.create(title: Faker::Company.name, description: Faker::Company.catch_phrase, creator_id: rand(2..6), category_id: rand(1..3))
	end

	200.times do
		Workout.create(user_id: rand(2..6), workout_template_id: rand(1..20), reps: rand(0..25), created_at: DateTime.new(2016,1,rand(1..31),4,5,6,'+7'))
	end

	100.times do
		Workout.create(user_id: rand(2..6), workout_template_id: rand(1..20), reps: rand(0..25), created_at: DateTime.new(2016,2,rand(1..18),4,5,6,'+7'))
	end


	1.upto(5) do |count|
		Group.create(name: Faker::Company.name, admin_id: count)
		GroupsUser.create(member_id: count, group_id: count)
	end

	30.times do
		GroupComment.create(member_id: rand(2..6), group_id: rand(1..5), comment_text: Faker::Hacker.say_something_smart)
	end



