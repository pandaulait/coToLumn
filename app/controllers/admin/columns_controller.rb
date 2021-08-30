class Admin::ColumnsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_normal_admin, only: [:update]

  def index
    @columns = Column.all
  end

  def update
    column = Column.find(params[:id])
    if column.update(column_params)
      flash[:notice] = "記事の更新に成功しました。"
    else
      flash[:alert] = "記事の更新に失敗しました。"
    end
    redirect_to request.referer
  end
  private
  def column_params
    params.require(:column).permit(:status)
  end

  def ensure_normal_admin
    if current_admin.email == 'example@example.com'
      flash[:alert] = "ゲスト管理者権限では、ステータスの変更はできません。"
      redirect_to request.referer
    end
  end
end
