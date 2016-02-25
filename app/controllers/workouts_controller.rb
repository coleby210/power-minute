class WorkoutsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create

    tagged_ids = params[:tagged_ids].values
    current_user.workouts.new(workout_params).save
    unless tagged_ids.length == 0
      tagged_ids.each do |user_id|
        Workout.create(user_id: user_id, workout_template_id: params[:workouts][:workout_template_id])
      end
    end
    redirect_to profile_path(current_user)
  end

  private
  def workout_params
    params.require(:workouts).permit(:workout_template_id)
  end
end
