class CommentsController < ApplicationController

  def top_commenters
    @top_commenters = Comment.top_commenters
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = I18n.t("comment_saved")
      redirect_to movie_path(comment_params[:movie_id])
    else
      flash[:alert] = I18n.t("comment_not_saved")
      redirect_to movie_path(comment_params[:movie_id])
    end
  end

  def destroy
    comment = Comment.find(comment_params[:id])
    if comment.destroy
      flash[:notice] = I18n.t("comment_deleted")
      redirect_to movie_path(comment_params[:movie_id])
    end
  end

  private

  def comment_params
    params.permit(:id, :comment, :movie_id)
  end

end
