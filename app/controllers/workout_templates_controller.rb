class WorkoutTemplatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_created_workout_templates_public = WorkoutTemplate.where(creator_id: current_user.id).where(private_status: false)
    @user_created_workout_templates_private = WorkoutTemplate.where(creator_id: current_user.id).where(private_status: true)
  end

  def show
    @workout_template = WorkoutTemplate.find(params[:id])
    @category = @workout_template.category
    @user_friends = []
    @user_groups = current_user.groups.each do |group|
      group.members.each do |member|
        @user_friends << member
      end
    end
    @user_friends.uniq!.delete(current_user)
  end

  def new
    @workout_template = current_user.workout_templates.new
    if request.xhr?
      render partial: 'form', layout: false
    else
      render 'new'
    end
  end

  def edit
    @workout_template = WorkoutTemplate.find(params[:id])
  end

  def create
    @workout_template = current_user.workout_templates.new(workout_template_params)

    if @workout_template.save
      if params[:favorite_status]
        current_user.favorites.create(workout_template_id: @workout_template.id)
      end
      redirect_to @workout_template
    else
      flash[:error] = @workout_template.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def workout_template_params
    input_hash = params.require(:workout_template).permit(:title, :description, :image)
    category = Category.find_by(name: "#{params[:category]}");

    unless category.nil?
      input_hash[:category_id] = category.id
    else
      # errors.add(:category_id, "needs to be selected")
    end

    unless params[:private_status].nil?
      input_hash[:private_status] = params[:private_status]
    else
      # error.add(:private_status, "needs to be selected")
    end

    input_hash
  end
end
