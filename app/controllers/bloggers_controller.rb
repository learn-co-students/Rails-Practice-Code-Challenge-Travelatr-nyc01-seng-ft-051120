class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show, :edit, :update, :destroy]

    def new
        @blogger = Blogger.new
    end

    def index
        @bloggers = Blogger.all
    end

    def show
    end

    def edit
    end

    def create
        blogger = Blogger.create(blogger_params)
        if blogger.valid?
            redirect_to bloggers_path
        else 
            flash[:blogger_errors] = blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    def update
        redirect_to blogger_path(@blogger)
    end

    def destroy
        redirect_to bloggers_path
    end

    private

    def blogger_params
        params.require(:blogger).permit!
    end

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end



end
