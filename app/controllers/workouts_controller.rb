class WorkoutsController < ApplicationController
  def create
    Workout.create(user_id: current_user.id, workout_template_id: params[:workouts][:workout_template_id])

    redirect_to profile_path(current_user)
  end
end
