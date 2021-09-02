class Admin::LiteraturesController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_correct_user, only: [:text_create, :text_destroy]
  def text_create
    @text = Text.find(params[:text_id])
    @literature = @text.literatures.new(literature_params)
    unless @literature.save
      flash[:alert] = '参考文献の保存に失敗しました。'
      redirect_to request.referer
    end
    @literature = Literature.new
  end

  def text_destroy
    @text = Text.find(params[:text_id])
    literature = Literature.find(params[:id])
    unless literature.destroy
      flash[:alert] = '参考文献の削除に失敗しました。'
      redirect_to request.referer
    end
    @literature = Literature.new
  end

  private

  def literature_params
    params.require(:literature).permit(:document)
  end

  def ensure_correct_user
    admin = Text.find(params[:text_id]).admin
    return if admin == current_admin

    redirect_to request.referer
    flash[:alert] = '他人の記事の編集はできません。'
  end
end
