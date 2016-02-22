class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @favorites = Favorite.all
  end

  def create
    if request.xhr?
      workout_template_id = params[:workout_template_id]
      @favorite = current_user.favorites.new(workout_template_id: workout_template_id)
      if @favorite.save
        render 'favorites/_remove_favorite', layout: false, locals: {current_user: current_user, favorite: @favorite}
      end
    else
      @favorite = current_user.favorites.new(workout_template_id: workout_template_id)
      category = WorkoutTemplate.find(params[:workout_template_id]).category
      if @favorite.save
        redirect_to category_path(category)
      end
    end

    # workout_template_id = params[:workout_template_id]
    # @favorite = current_user.favorites.new(workout_template_id: workout_template_id)

    # render json: @workout_template

    # p @favorite
  end

  def destroy

    if request.xhr?
      @favorite = Favorite.find(params[:id])
      workout_template = WorkoutTemplate.find(@favorite.workout_template_id)
      @favorite.destroy

      render 'favorites/_add_favorite', layout: false, locals: {workout_template: workout_template, current_user: current_user}
    else
      @favorite = Favorite.find(params[:id])
      @favorite.destroy
      redirect_to user_favorites_path(current_user)
    end

  end


end
