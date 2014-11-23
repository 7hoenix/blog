class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]

  def index
    @comments = Comment.all
    @post = Post.find(params[:post_id])
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    # @post = Post.find(comment_params[:post_id])
    if @comment.save
      redirect_to post_comments_path
    else
      render 'new'
    end

  end

  def show

  end


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :content, :post_id)
  end

end