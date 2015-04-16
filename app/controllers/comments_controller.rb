class CommentsController < ApplicationController
  def create
    @post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @user = current_user
    @comments = current_user.comments.create(:post_id => @post_id, :user_id => @user.id, :body => comment_params[:body])
    @user_id = @user.id
    if @comments.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
 
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :user, :user_id, :post, :post_id)
  end
  
end