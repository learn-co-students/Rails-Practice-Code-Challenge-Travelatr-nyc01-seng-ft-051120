class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show, :edit, :update]
    def def index
    @bloggers=Blogger.all
    end
    def show
    end

    def new
    @blogger=Blogger.new
    end

    def create
    @blogger=Blogger.create(blogger_params)
    redirect_to blogger_path(@blogger)
    end

    def update
    
    end
    
    def destroy
    
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end


end
