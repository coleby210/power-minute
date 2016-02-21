class GroupsUsersController < ApplicationController

  def create
    @workout_template = current_user.workout_templates.new(workout_template_params)

    if @workout_template.save
      redirect_to @workout_template
    else
      # render 'new'
    end
  end



end
