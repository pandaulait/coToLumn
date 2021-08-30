class Admin::ProblemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_normal_admin, only: [:update]

  def index
    @problems = Problem.all
  end

  def update
    problem = Problem.find(params[:id])
    if problem.update(problem_params)
      flash[:notice] = "記事の更新に成功しました。"
    else
      flash[:alert] = "記事の更新に失敗しました。"
    end
    redirect_to request.referer
  end
  private
  def problem_params
    params.require(:problem).permit(:status)
  end

  def ensure_normal_admin
    if current_admin.email == 'example@example.com'
      flash[:alert] = "ゲスト管理者権限では、ステータスの変更はできません。"
      redirect_to request.referer
    end
  end
end
