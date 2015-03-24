class CommentsController < ApplicationController
  def create
    @post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    @user = current_user
    @comments = current_user.comments.create(:post_id => @post_id, :user_id => @user.id, :body => comment_params[:body])
    if @comments.save
      flash[:notice] = "Comment was saved."
      redirect_to url_for(:action=>"show", :controller=>"posts", :format=>"26", :id=>@post.id , :topic_id=>@post.topic_id)
    else
      flash[:error] = "There was an error saving the post. Please try again."
      redirect_to '/topics'
    end
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end