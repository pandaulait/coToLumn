class Public::UsersController < ApplicationController
  before_action :ensure_normal_user, only: [:destroy, :update]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :confirm]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :confirm]
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @columns = @user.columns.order(created_at: :desc).includes(:literatures, image_attachment: :blob).limit(5)
    @problems = @user.problems.order(created_at: :desc).limit(5)
    @patches = @user.patches.order(created_at: :desc).includes(:text, :user, :image_attachment, :literatures).limit(5)
  end

  def confirm
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update(deleted_params)
      reset_session
      flash[:notice] = 'ありがとうございました。'
    else
      flash[:notice] = 'ありがとうございました。またのご利用を心よりお待ちしております。'
    end
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = '保存に成功しました'
      redirect_to user_path(@user.id)
    else
      flash[:notice] = '保存に失敗しました'
      render :edit
    end
  end

  def followings
    @user = User.find(params[:user_id])
  end

  def followers
    @user = User.find(params[:user_id])
  end

  def draft
    @user = User.find(params[:user_id])
    @columns = @user.columns.draft.order(created_at: :desc)
    @problems = @user.problems.draft.order(created_at: :desc)
    @patches = @user.patches.draft.order(created_at: :desc)
  end

  private

  def deleted_params
    params.require(:user).permit(:is_deleted)
  end

  def ensure_normal_user
    redirect_to root_path, alert: 'ゲストユーザーの更新はできません。' if current_user.email == 'guest@example.com'
  end

  def ensure_correct_user
    redirect_to user_path(current_user), alert: '他人の更新はできません。' unless User.find(params[:id]) == current_user
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
