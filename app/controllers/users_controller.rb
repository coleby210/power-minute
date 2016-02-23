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
    @user_stats = {}
    User.all.each do |user|
      @user_stats[user] = user.workouts.length
    end
    @user_stats = @user_stats.sort_by {|key, value| value}.reverse
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

  def schedule
    @hours = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour"]
    @days = current_user.schedule.days.order(:created_at)
  end

  protected

  def verify_user
    if !user_session
      redirect_to '/'
    end
  end



end
