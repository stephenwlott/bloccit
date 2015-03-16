class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post =  Post.find(params[:id])
    #@comments = current_user.comments.build(comment_params)
    #@comments = Comment.all
    @comment = Comment.where(:id => params[:id]).first
    
    @post.topic = @topic
    @comments.post = @post
    
    if @comments.update_attributes(params.require(:comments).permit(:body))
      flash[:notice] = "Comment was created."
      redirect_to @topic
    else
      flash[:error] = "There was an error creating the comment. Please try again."
      render :create
    end
  end
  
  def comment_params
    params.require(:comments).permit(:body)
  end
end
