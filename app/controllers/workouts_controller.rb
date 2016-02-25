class WorkoutsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def create
    current_user.workouts.new(workout_params).save

    redirect_to profile_path(current_user)
  end

  def destroy
    workout_to_delete = Workout.find(params[:id])
    Workout.destroy(workout_to_delete)
    redirect_to "/user_log"
  end

  private
  def workout_params
    params.require(:workouts).permit(:workout_template_id)
  end
end
