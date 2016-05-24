class Category < ActiveRecord::Base
	has_many :workout_templates
  has_many :workouts, through: :workout_templates

  def calculate_category_instances(user, time_period)
      now = Date.today
      self.workouts.where(user_id: user.id).where( "workouts.created_at > ?" ,now - time_period).count
  end
end
