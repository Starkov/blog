class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit( :body, :user_id))
    redirect_to post_path(@post)
  end
 
  def destroy 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.accessible_by(current_ability).find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
