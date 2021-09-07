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
    posts = if @topic.question == true
              @posts.answered
            else
              @posts
            end

    if current_user.present? && @topic.posts.answered.find_by(user_id: current_user.id).blank? && @topic.question == true
      # flash[:notice]="まだ答えていません"
      redirect_to topic_answer_path(@topic)
    else
      # flash[:notice] ="答えています"
      @entities = WordEvaluation.where(post_id: posts).group(:entity).select('sum(word_evaluations.score) as sum_score, word_evaluations.entity as entity')
      # @entities.each do |entity|
      #   p entity.entity # ex) 吾輩
      #   p entity.sum_score # 1.106...
      # end

      #        @words = @words.group(:entity).count(:entity)#.map{|key,value| [[["content",key], ["juyo",value.count]].to_h]}
      # byebug
      #        max = @words.max{|a,b| a[1]["juyo"] <=> b[1]["juyo"]}[1]["juyo"]
      #        if max > 10
      #          max = 10
      #        end
      #        min = @words.min{|a,b| a[1]["juyo"] <=> b[1]["juyo"]}[1]["juyo"]
      #        if max-min != 0
      #          @words.each do |word|
      #            word[1]["juyo"] = ((word[1]["juyo"]-min).to_f/(max-min).to_f)*10
      #          end
      #        end
      # end
      # byebug
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
    params.require(:topic).permit(:title, :user_id, :question)
  end
end
