class GroupsController < ApplicationController

  before_action :authenticate_user!

  def new
    @group = current_user.groups.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      GroupsUser.create(member_id: current_user.id, group_id: @group.id)
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @groupmembers = @group.members
  end




  private
  def group_params
    input_hash = params.require(:group).permit(:name, :picture, :admin_id)
    input_hash[:admin_id] = current_user.id
    input_hash
  end
end
