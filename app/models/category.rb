class Category < ActiveRecord::Base
	has_many :workout_templates
  has_many :workouts, through: :workout_templates

  def calculate_category_instances(user)
      self.workouts.where(user_id: user.id).length
  end
end
