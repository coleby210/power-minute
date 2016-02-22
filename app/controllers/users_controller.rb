class UsersController < ApplicationController
  before_action :verify_user
  def show
    @user = User.find(params[:id])
    @total_workouts = @user.workouts
    @distinct_workouts = @total_workouts.select(:workout_template_id).distinct
  end

  def top_users
    @user_stats = {}
    User.all.each do |user|
      @user_stats[user] = user.workouts.length
    end
    @user_stats = @user_stats.sort_by {|key, value| value}.reverse
    render :top_performers
  end

  protected

  def verify_user
    if !user_session
      redirect_to '/'
    end
  end



end
