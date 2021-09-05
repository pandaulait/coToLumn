class Public::TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @topic = Topic.new
    @topics = Topic.all
  end

  def create
    topic = Topic.new(topic_params)
    topic.user_id = current_user.id
    flash[:notice] = if topic.save
                       'トピックの作成に成功しました。'
                     else
                       'トピックの作成に失敗しました。'
                     end
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
    @new_post = Post.new
    @posts = @topic.posts
    if current_user.present? && @topic.posts.answered.find_by(user_id: current_user.id).present?
      flash[:notice] ="答えています"
      @words = []
      @posts.each do |po|
        if po.entities_array.present?
          po.entities_array.split.each do |word|
            @words << word
          end
        end
      end
      @words = @words.group_by(&:itself).map{|key,value| [[["content",key]].to_h,[["juyo",value.count]].to_h]}
      max = @words.max{|a,b| a[1]["juyo"] <=> b[1]["juyo"]}[1]["juyo"]
      min = @words.min{|a,b| a[1]["juyo"] <=> b[1]["juyo"]}[1]["juyo"]

      if max-min != 0
        @words.each do |word|
          word[1]["juyo"] = ((word[1]["juyo"]-min).to_f/(max-min).to_f)*10 + 4
        end
      end


      render layout: 'top_visual'
    elsif current_user.present? && @topic.posts.answered.find_by(user_id: current_user.id).blank?
      flash[:notice]="まだ答えていません"
      redirect_to topic_answer_path(@topic)

    else
      flash[:notice]="ログインなし"
      render layout: 'top_visual'
    end


  end

  def answer
    @topic = Topic.find(params[:topic_id])
    @new_post = Post.new
    # @posts = @topic.posts
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :user_id)
  end
end
