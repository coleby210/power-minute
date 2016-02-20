class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  has_many :workout_templates, foreign_key: :creator_id
  has_many :workouts

  def sort_most_common_workouts(time_period)
    now = Date.today
    @total_workouts = self.workouts.where( "created_at > ?" ,now - time_period)
    @distinct_workouts = @total_workouts.select(:workout_template_id).distinct

    @completed_workouts = {}

    @distinct_workouts.map do |workout|
      @time_period_workouts = workout.calculate_workout_instances(@total_workouts)
      if @time_period_workouts != 0
        @completed_workouts["#{workout.find_workout_template_name}"] =  @time_period_workouts
      end
    end

    Hash[@completed_workouts.sort_by{|k,v| v}.reverse]
  end

  def sort_most_common_categories(time_period)
    @total_workouts = self.workouts
    @completed_categories = {}

    Category.all.each do |category|
      @completed_categories["#{category.name}"] = category.calculate_category_instances(self, time_period)
    end

    Hash[@completed_categories.sort_by{|k,v| v}.reverse]
  end


end
