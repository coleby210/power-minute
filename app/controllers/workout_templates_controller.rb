class WorkoutTemplatesController < ApplicationController
  before_action :authenticate_user!

  def show
    @workout_template = WorkoutTemplate.find(params[:id])
    @category = @workout_template.category
  end

  def new
    @workout_template = current_user.workout_templates.new
  end

  def create
    @workout_template = current_user.workout_templates.new(workout_template_params)

    if @workout_template.save
      redirect_to @workout_template
    else
      render 'new'
    end
  end

  private
  def workout_template_params
    input_hash = params.require(:workout_template).permit(:title, :description, :image, :category_id)
    category = Category.find_by(name: "#{params[:category]}");
    input_hash[:category_id] = category.id
    input_hash
  end
end
