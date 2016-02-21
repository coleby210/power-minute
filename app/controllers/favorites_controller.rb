class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @favorites = Favorite.all
  end

  def create
    # p "--------------------------------------"
    # p params

    # if request.xhr?
    #   workout_template_id = params[:workout_template_id]
    #   @favorite = current_user.favorites.new(workout_template_id: workout_template_id)
    #   p @favorite
    #   # p @favorite
    #   # if @favorite.save
    #     render json: ['_remove_favorite', 3]
    #   # else
    #   # end
    # end

    # workout_template_id = params[:workout_template_id]
    # @favorite = current_user.favorites.new(workout_template_id: workout_template_id)

    # render json: @workout_template

    # p @favorite
  end


end
