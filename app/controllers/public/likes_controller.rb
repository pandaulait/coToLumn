class Public::LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_not_own_user, only: [:create]

  def create
    like = Like.new(like_params)
    like.user_id = current_user.id
    unless like.save
      flash[:alert] = "いいねができませんでした。"
      redirect_to request.referer
    end
    if like.liked_content_type == "Text" # text
      @liked_content = Text.find(like.liked_content_id)
    elsif like.liked_content_type == "Column" # column
      @liked_content = Column.find(like.liked_content_id)
    elsif like.liked_content_type == "Patch" # patch
      @liked_content = Patch.find(like.liked_content_id)
    elsif like.liked_content_type == "Problem" # problem
      @liked_content = Problem.find(like.liked_content_id)
    end
  end

  def destroy
    like = Like.find(params[:id])
    if like.liked_content_type == "Text" # text
      @liked_content = Text.find(like.liked_content_id)
    elsif like.liked_content_type == "Column" # column
      @liked_content = Column.find(like.liked_content_id)
    elsif like.liked_content_type == "Patch" # patch
      @liked_content = Patch.find(like.liked_content_id)
    elsif like.liked_content_type == "Problem" # problem
      @liked_content = Problem.find(like.liked_content_id)
    end
    like.destroy
  end



  private

  def like_params
    params.permit(:liked_content_id, :liked_content_type, :category)
  end
  # 自分の記事にいいねしないよう
  def ensure_not_own_user
    like = Like.new(like_params)
    if like.liked_content_type == "Column" # column
      liked_user = Column.find(like.liked_content_id).user
    elsif like.liked_content_type == "Patch" # patch
      liked_user = Patch.find(like.liked_content_id).user
    elsif like.liked_content_type == "Problem" # problem
      liked_user = Problem.find(like.liked_content_id).author
    end
    if liked_user == current_user
      redirect_to request.referer
      flash[:alert] = "自分の記事はいいねできません。"
    end
  end
end
