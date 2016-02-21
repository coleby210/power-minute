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

  def number_of_workouts_per_day
    daily_workouts = {}
    first_workout = (self.workouts.first.created_at).to_date
    @total_workouts = self.workouts

    # first_workout = first_workout.to_date

    while (first_workout < Date.today)
      daily_workouts[first_workout] =  @total_workouts.where( "created_at < ?" , first_workout + 1).where( "created_at > ?" , first_workout).length

      first_workout += 1;
    end

    p daily_workouts
    # p daily_workouts.keys

  end


  def is_group_admin?(group)
    self.id == group.admin_id
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
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
