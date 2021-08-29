class Public::LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user
  #linkをAjaxで作成
  def create
    @column = Column.find(params[:column_id])
    @link = Link.new(link_params)
    if @link.save
      redirect_to columns_link_path(@column)
      flash[:notice] = "記事の保存に成功しました。"
    else
      flash[:alert] = "記事の保存に失敗しました。"
      render columns_link_path(@column)
    end
  end
  #linkをAjaxで消去
  def destroy
    @column = Column.find(params[:column_id])
    @link = Link.find(params[:id])
    if @link.destroy
      redirect_to columns_link_path(@column)
      flash[:notice] = "記事の保存に成功しました。"
    else
      flash[:alert] = "記事の保存に失敗しました。"
      render columns_link_path(@column)
    end
  end
  def ajax
    @column = Column.find(params[:column_id])
    @text = Text.find(params[:text_id])
    @texts = Text.all
    @link = Link.new
  end

  private
  def link_params
    params.require(:link).permit(:text_id, :column_id)
  end

  def ensure_correct_user
    user = Column.find(params[:column_id]).user
    unless user == current_user
      redirect_to request.referer
      flash[:alert] = "他人のコラムは編集できません。"
    end
  end
end
