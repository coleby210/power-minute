class WorkoutTemplatesController < ApplicationController
  def show
    @workout_template = WorkoutTemplate.find(params[:id])
  end
end
