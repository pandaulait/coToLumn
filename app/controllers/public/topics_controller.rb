class Public::TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  def index
    @topic = Topic.new
    @topics = Topic.all
  end

  def create
    topic = Topic.new(topic_params)
    topic.user_id = current_user.id
    if topic.save
      flash[:notice] = "トピックの作成に成功しました。"
    else
      flash[:notice] = "トピックの作成に失敗しました。"
    end
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
    @new_post = Post.new
    @posts = @topic.posts
  end

  def destroy

  end

  private
  def topic_params
    params.require(:topic).permit(:title, :user_id)
  end
end
