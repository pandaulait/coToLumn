class Public::RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    if user == current_user
      flash[:notice] = "自分をフォローすることはできません。"
    else
      current_user.follow(user.id)
    end
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    # user = User.find(params[:user_id])
    # Relationship.find(1).destroy
    redirect_to request.referer
  end
end
