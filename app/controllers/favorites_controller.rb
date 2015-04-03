class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    if favorite.save
      flash[:notice] = "Post was favorited successfully."
      redirect_to [@post.topic, @post]
    else
      flash[:notice] = "There was a problem favoriting the post. Try again."
      redirect_to [@post.topic, @post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by_post_id(@post.id)
    authorize favorite
    if favorite.destroy
      flash[:notice] = "Post was unfavorited successfully."
      redirect_to [@post.topic, @post]
    else
      flash[:notice] = "There was a problem unfavoriting the post. Try again."
      redirect_to [@post.topic, @post]
    end
  end
  
end
