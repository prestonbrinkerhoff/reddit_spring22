class Api::TopicsController < ApplicationController
  
  before_action :set_sub
  before_action :set_topic, only: [:show, :update, :destroy]
  
  def set_parent
    @parent = Parent.find(params[:parent_id])
  
  def inedex
    render json: @sub.topics
  end

  def show
    render json: @topic
  end

  def create
    @topic = @sub.topics.new(topic_params)
    if @topic.save 
      render json: @topic
    else
      render json: { errors: @topic.errors }, staus: :unprocessable_entity
    end
    end

  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: { errors: @topic.errors }, staus: :unprocessable_entity
    end
    end

  def destroy
    @topic.destroy
    render json: { message: 'Topic deleted' }
  end

  private

  def set_sub
    @sub = Sub.find(params[:sub_id])
  end
  
  def set_topic
    @topic = @sub.topics.find(params[:id])
  end

  def topics_params
    params.require(:topic).permit(:title, :Lbody)
  end
end
