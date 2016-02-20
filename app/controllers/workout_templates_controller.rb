class WorkoutTemplatesController < ApplicationController
  before_action :authenticate_user!

  def show
    @category = params[:category_id]
    @workout_template = WorkoutTemplate.find(params[:id])
  end
end
