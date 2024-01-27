class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(author_id: :desc)
    # @posts = @posts.paginate(page: params[:page], per_page: 1)
    @comments = Comment.all.order(id: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.most_recent_comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  # Create action to handle post creation
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.likes_counter = 0
    @post.comments_counter = 0
    if @post.save
      @user = User.find(params[:user_id])
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else

      pp @post.errors
      pp @post.errors.full_messages
      @user = User.find(params[:user_id])
      render 'new'
    end
  end

  # Edit action to display the post edit form
  def edit
    @post = Post.find(params[:id])
  end

  # Update action to handle post updates
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render 'edit'
    end
  end

  # Destroy action to delete a post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
