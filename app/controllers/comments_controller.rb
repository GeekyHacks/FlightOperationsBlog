class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    # puts @comment
    if @comment.save
      redirect_to user_post_path(current_user, params[:post_id])
    else
      puts @comment.errors.messages
      render :new
    end
  end

  private

  def comment_params
    params.require(:post_id).permit(:text)
  end
end
