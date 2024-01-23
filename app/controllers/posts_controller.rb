class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(author_id: :desc)
    # @posts = @posts.paginate(page: params[:page], per_page: 1)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
