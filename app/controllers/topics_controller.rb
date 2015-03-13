class TopicsController < ApplicationController
  def index
    puts "-- topics_controller.index --"
    @topics = paginate({1 => 10})
    authorize @topics
  end
  
  def paginate(page_hash = {})
    puts "-- topics_controller.page_it --"    
    puts "----------- page_hash = #{page_hash}"
    pg, per_pg = page_hash.first
    puts "----------- pg = #{pg}, per_pg = #{per_pg}"
    Topic.limit(per_pg).offset((pg - 1)*per_pg)
  end
  
  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end
  
  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end
 
  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end
  
  def temp1
    puts "--- TopicsController.temp1 method ---"
  end

end
