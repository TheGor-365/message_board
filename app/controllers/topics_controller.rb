class TopicsController < ApplicationController
  before_action :set_topic, only: %i[ show edit update destroy ]

  def index
    @topics = Topic.all
  end

  def show; end
  def edit; end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save ? (redirect_to topic_url(@topic)) : (render :new)
  end

  def update
     @topic.update(topic_params) ? (redirect_to topic_url(@topic)) : (render :edit)
  end

  def destroy
    @topic.destroy
    redirect_to topics_url
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content, :user_id)
  end
end
