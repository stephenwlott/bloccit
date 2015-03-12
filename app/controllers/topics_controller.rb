class TopicsController < ApplicationController
  def index
    temp1
    #Topic.temp
    #@topics = Topic.paginate(page: params[:page], per_page: 10)
    #@topics = paginate(page: params[:page], per_page: 10)
    @topics = paginate(params[:page], 10)
    authorize @topics
  end

  def temp1
    puts "--- TopicsController.temp1 method ---"
  end
  
  def paginate(pg, per_pg)
    puts "-- TopicsController.paginate --"
    pag = Hash.new
    
    puts "pg=#{pg}, per_pg=#{per_pg}"
    

    return pag
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
end
