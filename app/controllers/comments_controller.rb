class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build comment_params
    @comment.save
  end

  private
  def comment_params
    params.require(:comment).permit :user_id, :status_id, :content
  end
end
