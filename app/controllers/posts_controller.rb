class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
        redirect_to post_path(@post)
    else
        flash[:errors] = @post.errors.full_messages
        redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.valid?
        redirect_to post_path(@post)
    else
        flash[:errors] = @post.errors.full_messages
        redirect_to edit_post_path(@post)
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.add_like
    @post.save

    redirect_to post_path(@post)
  end

private

def post_params
  params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
end

end
