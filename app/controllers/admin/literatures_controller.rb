class Admin::LiteraturesController < ApplicationController
  def text_create
    @text = Text.find(params[:text_id])
    @literature = @text.literatures.new(literature_params)
    if @literature.save
      flash[:notice] = "記事の保存に成功しました。"
    else
      flash[:alert] = "記事の保存に失敗しました。"
    end
    @literature = Literature.new
  end

  def text_destroy
    @text = Text.find(params[:text_id])
    literature = Literature.find(params[:id])
    if  literature.destroy
      flash[:notice] = "記事の削除に成功しました。"
    else
      flash[:notice] = "記事の削除に失敗しました。"
    end
    @literature = Literature.new
  end

  private
  def literature_params
    params.require(:literature).permit(:document)
  end
end
