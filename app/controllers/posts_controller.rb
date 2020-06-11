class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :like, :destroy]
  def like
    @post.update(likes: @post.likes+=1)
        redirect_to post_path(@post)
  end

  def index
    @posts= Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      p params
      flash[:errors] = @post.errors.full_messages
      render 'new'
    end
  end

  def edit
   @post = Post.find(params[:id])
 end

 def update
  @post = Post.find(params[:id])

  if @post.update(post_params)
    redirect_to @post
  else
    flash[:errors] = @post.errors.full_messages
    render 'edit'
  end
end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
   params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end
