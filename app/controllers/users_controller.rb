class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @total_workouts = Workout.where(user_id: @user.id)
    @distinct_workouts = @total_workouts.select(:workout_template_id).distinct
    sort_most_common_workouts
    # @workout_names = find_workout_names(@workouts)

    render :show
  end

  def sort_most_common_workouts
    @completed_workouts = {}

    @distinct_workouts.map do |workout|
      @completed_workouts["#{workout.find_workout_template_name}"] =  workout.calculate_workout_instances(@total_workouts)
    end

    @completed_workouts = Hash[@completed_workouts.sort_by{|k,v| v}.reverse]

    puts @completed_workouts

  end


  protected

  # # Find the names of all workouts performed by a user
  # def find_workout_template_name(workout)
  #   WorkoutTemplate.find(workout.workout_template_id).title

  #   # workout_names = []

  #   # workouts.each do |workout|
  #   #   workout_names << WorkoutTemplate.find(workout.workout_template_id).title
  #   # end

  #   # workout_names
  # end

end
