class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    private 
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end


end
