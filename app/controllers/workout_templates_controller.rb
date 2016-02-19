class WorkoutTemplatesController < ApplicationController
  before_action :authenticate_user!

  def show
    @workout_template = WorkoutTemplate.find(params[:id])
  end
end
