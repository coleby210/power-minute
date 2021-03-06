class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :workout_templates, foreign_key: :creator_id
  has_many :workouts
  has_many :groups, foreign_key: :admin_id
  has_many :groups_users, foreign_key: :member_id
  has_many :favorites
  has_many :group_comments, foreign_key: :member_id
  has_one :schedule

  def calculate_number_of_workouts(time_period)
    today = Date.today
    @number_of_workouts = self.workouts.where( "created_at > ?" ,today - time_period).length
  end

  def calculate_change_in_workout_frequency(time_period,compared_time_period)
    today = Date.today

    @total_workouts_in_range = self.workouts.where( "created_at > ?" ,today - compared_time_period).length
    @current_workouts_in_range = self.workouts.where( "created_at > ?" ,today - time_period).length
    @percent_change = ((((@current_workouts_in_range)/(@total_workouts_in_range - @current_workouts_in_range).to_f)-1).round(2)*100)
    if @percent_change > 0
      "+"+ @percent_change.to_s + "%"
    else
      @percent_change.to_s + "%"
    end
  end

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

  def number_of_workouts_per_day(first_workout, jump_time)
    daily_workouts = {}
    @total_workouts = self.workouts.where("created_at > ?", first_workout).order(created_at: :ASC)
    last_workout = first_workout + jump_time

    @total_workouts.each_with_index do |workout,index|
      if (daily_workouts.has_key?("#{first_workout.strftime('%m-%d')}" + "-" + "#{(last_workout - 1).strftime('%m-%d')}")) && (workout.created_at.to_date < last_workout)
        daily_workouts["#{first_workout.strftime('%m-%d')}" + "-" + "#{(last_workout - 1).strftime('%m-%d')}"] += 1
      else
        first_workout += jump_time unless index == 0
        last_workout += jump_time unless index == 0
        daily_workouts["#{first_workout.strftime('%m-%d')}" + "-" + "#{(last_workout - 1).strftime('%m-%d')}"] = 1
      end
    end

    if last_workout < Date.today
      while last_workout <= Date.today
        unless daily_workouts["#{first_workout.strftime('%m-%d')}" + "-" + "#{(last_workout - 1).strftime('%m-%d')}"]
          daily_workouts["#{first_workout.strftime('%m-%d')}" + "-" + "#{(last_workout - 1).strftime('%m-%d')}"] = 0
        end
        if last_workout + jump_time > Date.today
          daily_workouts["#{last_workout.strftime('%m-%d')}" + "-" + "#{Date.today.strftime('%m-%d')}"] = 0
        end
        last_workout += jump_time
        first_workout += jump_time
      end
    end

    daily_workouts

  end


  def is_group_admin?(group)
    self.id == group.admin_id
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name
      user.timezone = auth.extra.raw_info.timezone
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
