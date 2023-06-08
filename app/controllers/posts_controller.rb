class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if logged_in?
      @post = current_user.posts.build(post_params)
    else
      # Handle the case when the user is not logged in
      # For example, you can redirect them to the login page or show an error message
      redirect_to login_path, flash: { error: "You must be logged in to create a post." }
      return
    end

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
