class Public::PostsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    new_post =  Post.new(post_paramas)
    new_post.user_id = current_user.id
    if @topic.posts.count == 0
      new_post.number = 1
    else
      new_post.number = @topic.posts.count + 1
    end
    if new_post.save
      flash[:notice] = "コメントの保存に成功しました。"
    else
      flash[:alert] = "コメントの保存に失敗しました。"
    end
    redirect_to topic_path(@topic)
  end

  def ajax
    @new_post = Post.new
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end

  private
  def post_paramas
    params.require(:post).permit(:body ,:user_id, :parent_id, :topic_id)
  end
end
