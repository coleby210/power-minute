class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @workout_templates = @category.workout_templates.where(private_status: false)
  end

end
