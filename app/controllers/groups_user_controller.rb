class GroupsUserController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @newgroupmember = User.find_by(email: params[:new_user_email])
    @group = Group.find(params[:group_id])

    if @newgroupmember
      if @group.members.include?(@newgroupmember) == false
        GroupsUser.create(member_id: @newgroupmember.id, group_id: @group.id)
      else
        #add error that member is already part of group
      end
    else
      #add error that user was not found
    end
    redirect_to "/groups/#{params[:group_id]}"
  end

  def destroy
    groupmember_to_delete = GroupsUser.find_by(member_id: params[:id], group_id: params[:group_id]).id
    GroupsUser.destroy(groupmember_to_delete)
    if current_user.is_group_admin?(Group.find(params[:group_id]))
    redirect_to "/groups/#{params[:group_id]}"
    else
      redirect_to "/groups"
    end
  end

  def update
    # change group admin
  end

end
