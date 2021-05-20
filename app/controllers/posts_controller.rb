class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render :show, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:title, :body, :icatch).merge(user: current_user)
    end
end
