class PostsController < ApplicationController

   def index
      @posts = Post.all
   end

   def show
      @post = Post.find(params[:id])
   end

   def increase_likes
      @post = Post.find(params[:id])
      @post.increase_likes
      @post.save
      redirect_to post_path(@post)
   end

   def new
      @post = Post.new
   end

   def create
      @post = Post.new(post_params)
      @post.save
      redirect_to post_path(@post)
   end

   def edit
      @post = Post.find(params[:id])
   end
   
   def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
         redirect_to @post
      else
         render 'edit' 
      end
   end

   private 

   def post_params
      params.require(:post).permit(:title, :content, :destination_id, :blogger_id, :likes)
   end

   
end
