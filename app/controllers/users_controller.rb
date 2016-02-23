class UsersController < ApplicationController
  before_action :verify_user
  def show
    @user = User.find(params[:id])
    @total_workouts = @user.workouts
    @distinct_workouts = @total_workouts.select(:workout_template_id).distinct
    if request.xhr?
      render :json => [@user.sort_most_common_categories(7),@user.sort_most_common_categories(31),sort_most_common_categories(1000).to_json]
    end
  end

  def top_users

    @top_users = User.find_by_sql("Select users.*, COUNT(workouts.id) AS c from users, workouts WHERE workouts.user_id = users.id GROUP BY users.id ORDER BY c DESC")
    p @top_users
    # @user_stats = {}
    # User.all.each do |user|
    #   if user.workouts.length > 0
    #   @user_stats[user] = [user.workouts.length, user.sort_most_common_workouts(1000).first[0]]
    #   end
    # end

    # @user_stats = @user_stats.sort_by {|key, value| value}.reverse
    render :top_performers
  end

  def get_7
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_categories(7)
  end

  def get_31
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_categories(31)
  end

  def get_all_time
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_categories(1000)
  end

  protected

  def verify_user
    if !user_session
      redirect_to '/'
    end
  end



end
