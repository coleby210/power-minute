class GroupCommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    stuff = comment_params
    puts stuff
    @comment = GroupComment.new(comment_params)
    if @comment.save
      redirect_to "/groups/#{params[:comment][:group_id]}"
    else
      #errors
    end
  end

  def comment_params
    input_hash = params.require(:comment).permit(:member_id, :group_id, :comment_text)
    input_hash
  end



end
