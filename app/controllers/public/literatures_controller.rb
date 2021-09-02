class Public::LiteraturesController < ApplicationController
  before_action :authenticate_user!
  before_action :column_ensure_correct_user, only: [:column_create, :column_destroy]
  before_action :patch_ensure_correct_user, only: [:text_patch_create, :text_patch_destroy]
  def index
  end

  def text_patch_index
    @patch = Patch.find(params[:patch_id])
    @text = Text.find(params[:text_id])
    @literature = Literature.new
  end

  def text_patch_create
    @patch = Patch.find(params[:patch_id])
    @text = Text.find(params[:text_id])
    literature = @patch.literatures.new(literature_params)
    if literature.save
      flash[:notice] = '記事の保存に成功しました。'
    else
      flash[:alert] = '記事の保存に失敗しました。'
    end
    @literature = Literature.new
  end

  def text_patch_destroy
    @patch = Patch.find(params[:patch_id])
    @text = Text.find(params[:text_id])
    literature = Literature.find(params[:id])
    flash[:notice] = if literature.destroy
                       '記事の削除に成功しました。'
                     else
                       '記事の削除に失敗しました。'
                     end
    @literature = Literature.new
  end

  def column_create
    @column = Column.find(params[:column_id])
    literature = @column.literatures.new(literature_params)
    if literature.save
      flash[:notice] = '記事の保存に成功しました。'
    else
      flash[:alert] = '記事の保存に失敗しました。'
    end
    @literature = Literature.new
  end

  def column_destroy
    @column = Column.find(params[:column_id])
    literature = Literature.find(params[:id])
    flash[:notice] = if literature.destroy
                       '記事の削除に成功しました。'
                     else
                       '記事の削除に失敗しました。'
                     end
    @literature = Literature.new
  end

  private

  def literature_params
    params.require(:literature).permit(:document)
  end

  def column_ensure_correct_user
    user = Column.find(params[:column_id]).user
    return if user == current_user

    redirect_to request.referer
    flash[:alert] = '他人の記事の編集はできません。'
  end

  def patch_ensure_correct_user
    user = Patch.find(params[:patch_id]).user
    return if user == current_user

    redirect_to request.referer
    flash[:alert] = '他人の記事の編集はできません。'
  end
end
