class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user

    like = Like.new(user: current_user, post: @post)

    if like.save
      flash[:success] = 'Post liked!'
    else
      pp @like.errors
      flash[:error] = 'Error liking the post.'
    end
    redirect_to request.referer
  end
end
