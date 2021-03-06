class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:ajax2]
  def create
    @topic = Topic.find(params[:topic_id])
    new_post = Post.new(post_params)
    new_post.user_id = current_user.id
    new_post.score = Language.get_data(post_params[:body])  # この行を追加
    new_post.number = if @topic.posts.count.zero?
                        1
                      else
                        @topic.posts.count + 1
                      end
    if new_post.save
      new_post.word_evaluations.create(Language.get_data3(post_params[:body]))
      flash[:notice] = 'コメントの保存に成功しました。'
    else
      flash[:alert] = 'コメントの保存に失敗しました。'
    end
    redirect_to topic_path(@topic)
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    Post.where(user_id: @post.user_id, topic_id: @topic.id).update_all(answer: false)
    @post.update(post_params)
    redirect_to topic_path(@topic)
  end

  def ajax
    @new_post = Post.new
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end

  def ajax2
    @new_post = Post.new
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :parent_id, :topic_id, :answer)
  end
end
