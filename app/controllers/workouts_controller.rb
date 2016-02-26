class WorkoutsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    current_user.workouts.new(workout_params).save
    if params[:tagged_ids]
      tagged_ids = params[:tagged_ids].values
      tagged_ids.each do |user_id|
        Workout.create(user_id: user_id, workout_template_id: params[:workouts][:workout_template_id])
      end
    end
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
