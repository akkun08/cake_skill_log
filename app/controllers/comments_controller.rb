class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to skill_path(params[:skill_id])
  end

  def destroy
    @comment = Comment.find_by(skill_id: params[:skill_id], id: params[:id])
    if @comment.destroy
      redirect_to skill_path(params[:skill_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, skill_id: params[:skill_id])
  end
end
