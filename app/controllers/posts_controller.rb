class PostsController < ApplicationController
  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all 
    @destinations = Destination.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      redirect_to post_path(@post)
    else
      flash[error] =["You fuck it up"]
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @bloggers = Bloggers.all 
    @destinations = Destination.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params) 
      redirect_to post_path(@post)
    else
      flash[error] =["You fuck it up"]
      redirect_to new_post_path
    end
  end

  def increase_likes
    @post = Post.find(params[:id])
    @post.increase_likes

  end

  private
  def post_params 
    params.require(:post).permit(:title,:content,:likes,:blogger_id,:destination_id)
  end

end
