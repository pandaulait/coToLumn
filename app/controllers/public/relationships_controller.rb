class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_not_own_user, only: [:create]

  def create
    user = User.find(params[:user_id])
    current_user.follow(user.id)
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    # user = User.find(params[:user_id])
    # Relationship.find(1).destroy
    redirect_to request.referer
  end


  private
  # 自分をフォローしないように
  def ensure_not_own_user
    user = User.find(params[:user_id])
    if user == current_user
      redirect_to request.referer
      flash[:alert] = "自分をフォローすることはできません。"
    end
  end
end
