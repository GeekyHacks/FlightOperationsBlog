class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = @post.comments.new
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
    params.require(:post_id).permit(:text, :post_id, :user_id)
  end
end
