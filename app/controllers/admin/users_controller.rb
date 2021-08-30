class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_normal_admin, only: [:update]

  def index
    @users = User.all
  end
  def update
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      flash[:notice] = "ゲストユーザーの更新はできません。"
    else
      if @user.update(deleted_params)
        flash[:notice] = "保存に成功しました"
      else
        flash[:notice] = "保存に失敗しました"
      end
    end
    redirect_to request.referer
  end
  private


  def deleted_params
    params.require(:user).permit(:is_deleted)
  end
  def ensure_normal_admin
    if current_admin.email == 'example@example.com'
      flash[:alert] = "ゲスト管理者権限では、ステータスの変更はできません。"
      redirect_to request.referer
    end
  end
end
