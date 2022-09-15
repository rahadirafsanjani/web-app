class CommentsController < ApplicationController
  before_action :comment_params, only: %i[ show edit update destroy ]
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    Comment.create(comment_params.merge(post_id: params[:post_id],user_id: current_user.id ))
    redirect_to post_url(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  # @post = Post.find(params[:post_id])
  # @comment = @post.comments.new(params[:comment])
  # @comment.user = current_user

end
