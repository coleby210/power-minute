class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @total_workouts = current_user.workouts
    @distinct_workouts = @total_workouts.select(:workout_template_id).distinct
    sort_most_common_workouts
    sort_most_common_categories
    # @workout_names = find_workout_names(@workouts)

    render :show
  end

  def sort_most_common_workouts
    @completed_workouts = {}

    @distinct_workouts.map do |workout|
      @completed_workouts["#{workout.find_workout_template_name}"] =  workout.calculate_workout_instances(@total_workouts)
    end

    @completed_workouts = Hash[@completed_workouts.sort_by{|k,v| v}.reverse]

  end

  def sort_most_common_categories
    @completed_categories = {}

    Category.all.each do |category|
      @completed_categories["#{category.name}"] = category.calculate_category_instances(current_user)
    end

    @completed_categories = Hash[@completed_categories.sort_by{|k,v| v}.reverse]
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
