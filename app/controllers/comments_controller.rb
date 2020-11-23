class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/members/#{comment.member.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, member_id: params[:member_id])
  end
end
