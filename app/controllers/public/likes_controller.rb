class Public::LikesController < ApplicationController
  def create
    like = Like.new(like_params)
    like.user_id = current_user.id
    if like.save
      flash[:notice] = "記事の保存に成功しました。"
    else
      flash[:alert] = "記事の保存に失敗しました。"
    end
    if like.liked_content_type == "Text" # text
      @liked_content = Text.find(like.liked_content_id)
    elsif like.liked_content_type == "Column" # column
      @liked_content = Column.find(like.liked_content_id)
    elsif like.liked_content_type == "Patch" # patch
      @liked_content = Patch.find(like.liked_content_id)
    end

  end

  def destroy
    like = Like.find(params[:id])
    if like.liked_content_type == "Text" # text
      @liked_content = Text.find(comment.article_id.to_i)
    elsif like.liked_content_type == "Column" # column
      @liked_content = Column.find(like.liked_content_id)
    elsif like.liked_content_type == "Patch" # patch
      @liked_content = Patch.find(comment.article_id.to_i)
    end
    like.destroy
  end
  private
  def like_params
    params.permit(:liked_content_id, :liked_content_type, :category)
  end
end
