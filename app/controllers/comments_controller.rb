class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.create!(permitted_params)
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def permitted_params
    params.require(:comment).permit(:content)
  end
end
