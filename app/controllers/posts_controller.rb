class PostsController < ApplicationController
    
    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update
        redirect_to post_path(@post)
    end

    def show
        @post = Post.find(params[:id])

    end

    def like
        @post = Post.find(params[:id])
        # byebug
        @post.increase_likes
        @post.save
        redirect_to post_path(@post)
    end

    

    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit!
    end
end
