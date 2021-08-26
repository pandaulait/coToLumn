class Public::UsersController < ApplicationController
  before_action :ensure_normal_user, only: :destroy


  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def confirm
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:notice] = "ご本人様でないと、退会することはできません。"
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update(deleted_params)
      reset_session
      flash[:notice] = "ありがとうございました。"
      redirect_to root_path
    else
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    end
  end
  def followings

  end
  def followers

  end


  private
  def deleted_params
    params.require(:user).permit(:is_deleted)
  end

  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新はできません。'
    end
  end
end
