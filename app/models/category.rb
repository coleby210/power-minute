class Category < ActiveRecord::Base
	has_many :workout_templates
  has_many :workouts, through: :workout_templates
end
