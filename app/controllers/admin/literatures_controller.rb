class Admin::LiteraturesController < ApplicationController
    def text_create
    @text = Text.find(params[:text_id])
    if params[:literature][:document] == nil || params[:literature][:document] ==""
      flash[:alert] = "記事の保存に失敗しました。"
      @literature = Literature.new
    else
      @text.literatures.create(document: params[:literature][:document])
      flash[:notice] = "記事の保存に成功しました。"
      @literature = Literature.new
    end
  end

  def text_destroy
    @text = Text.find(params[:text_id])
    literature = Literature.find(params[:id])
    if  literature.destroy
      flash[:notice] = "記事の削除に成功しました。"
      @literature = Literature.new
    else
      flash[:notice] = "記事の削除に失敗しました。"
      @literature = Literature.new
    end
  end
end
