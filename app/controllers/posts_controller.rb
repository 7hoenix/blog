class PostsController < ApplicationController
  before_action :assign_post, only: [:new, :show]
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  private

  def assign_post
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:title, :author, :content)
  end

end