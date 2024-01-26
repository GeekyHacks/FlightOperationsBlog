class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(author_id: :desc)
    # @posts = @posts.paginate(page: params[:page], per_page: 1)
    @comments = Comment.all.order(id: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments.limit(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
