class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #@post = Post.find(parms[:id])
  end

  def new
  end

  def edit
  end
end
