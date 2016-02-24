class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout_template
  has_one :category, through: :workout_template



  def find_workout_template_name
    WorkoutTemplate.find(self.workout_template_id).title
  end

  def calculate_workout_instances(total_workouts)
    total_workouts.where(workout_template_id: self.workout_template_id).count
  end
end
