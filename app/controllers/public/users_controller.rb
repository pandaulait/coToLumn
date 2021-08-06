class Public::UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def confirm
    @user = User.find(params[:id])
    if @user == current_user
      
    else
      flash[:notice] = "ご本人様でないと、退会することはできません。"
      redirect_to root_path
    end
  end
  def destroy
    @user = User.find_by(params[:user][:id])
    @user.update(deleted_params)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end



  private
  def deleted_params
    params.require(:user).permit(:is_deleted)
  end
end
