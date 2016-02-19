class Category < ActiveRecord::Base
	has_many :workout_templates
end
