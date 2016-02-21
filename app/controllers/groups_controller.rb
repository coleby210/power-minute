class GroupsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def new
    @group = current_user.groups.new
  end

  def index
    p GroupsUser.find_by(member_id: current_user.id)
    @usergroups = GroupsUser.where(member_id: current_user.id)
    @groups = []
    @usergroups.each do |groupuser|
      @groups << Group.find(groupuser.group_id)
    end
    @groups
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
    @groupcomments = GroupComment.where(group_id: @group.id)
  end

  def destroy
    group_to_delete = Group.find(params[:id])
    Group.destroy(group_to_delete)
    redirect_to "/groups/#{params[:group_id]}"
  end

  private
  def group_params
    input_hash = params.require(:group).permit(:name, :picture, :admin_id)
    input_hash[:admin_id] = current_user.id
    input_hash
  end
end
