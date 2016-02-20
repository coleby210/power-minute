class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  has_many :workout_templates, foreign_key: :creator_id
  has_many :workouts

  def sort_most_common_workouts
    @total_workouts = self.workouts
    @distinct_workouts = @total_workouts.select(:workout_template_id).distinct

    @completed_workouts = {}

    @distinct_workouts.map do |workout|
      @completed_workouts["#{workout.find_workout_template_name}"] =  workout.calculate_workout_instances(@total_workouts)
    end

    Hash[@completed_workouts.sort_by{|k,v| v}.reverse]
  end

  def sort_most_common_categories
    @total_workouts = self.workouts
    @completed_categories = {}

    Category.all.each do |category|
      @completed_categories["#{category.name}"] = category.calculate_category_instances(self)
    end
    Hash[@completed_categories.sort_by{|k,v| v}.reverse]
  end


end
