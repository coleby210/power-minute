class WorkoutsController < ApplicationController
  def create
    current_user.workouts.new(workout_params).save

    redirect_to profile_path(current_user)
  end

  private
  def workout_params
    params.require(:workouts).permit(:workout_template_id)
  end
end
