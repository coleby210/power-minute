class UsersController < ApplicationController
  before_action :verify_user
  def show
    @user = User.find(params[:id])
    @total_workouts = @user.workouts.order(created_at: :ASC)
    @distinct_workouts = @total_workouts.select(:workout_template_id).distinct
    if request.xhr?
      render :json => [@user.sort_most_common_categories(7),@user.sort_most_common_categories(31),sort_most_common_categories(1000).to_json]
    end
  end

  def top_users

    @top_users = User.find_by_sql("Select users.*, COUNT(workouts.id) AS c from users, workouts WHERE workouts.user_id = users.id GROUP BY users.id ORDER BY c DESC")
    render :top_performers
  end

  def log
    @user_workouts = current_user.workouts.order(created_at: :desc )
    render :log
  end

  def get_7_side
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_workouts(7)
  end

  def get_30_side
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_workouts(31)
  end

  def get_all_time_side
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_workouts(1000)
  end


  def get_7_pie
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_categories(7)
  end

  def get_31_pie
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_categories(31)
  end

  def get_all_time_pie
    @user = User.find(params[:id])
    render :json => @user.sort_most_common_categories(1000)
  end

  def get_7_bar
    @user = User.find(params[:id])
    first_workout = Date.today - 7
    render :json => @user.number_of_workouts_per_day(first_workout, 1)
  end

  def get_30_bar
    @user = User.find(params[:id])
    first_workout = Date.today - 29
    render :json => @user.number_of_workouts_per_day(first_workout, 3)
  end

  def get_all_time_bar
    @user = User.find(params[:id])
    @total_workouts = @user.workouts.order(created_at: :ASC)
    if Date.today - 1000 > @total_workouts.first.created_at.to_date
      first_workout = Date.today - 1000
    else
      first_workout = @total_workouts.first.created_at.to_date
    end


    Date.today - @user.created_at.to_date > 180 ? jump_time = 30 : jump_time = 7

    render :json => @user.number_of_workouts_per_day(first_workout, jump_time)
  end

  def schedule
    @hours = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "twentyone", "twentytwo", "twentythree"]
    @days = current_user.schedule.days.order(:created_at)
  end

  protected

  def verify_user
    if !user_session
      redirect_to '/'
    end
  end



end
