class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    # GET /posts/new
    def new
        @post = Post.new
    end

    # POST /posts
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
