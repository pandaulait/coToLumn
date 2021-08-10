class Public::LiteraturesController < ApplicationController

  def index
  end
  def text_patch_create
    @patch = Patch.find(params[:patch_id])
    @text = Text.find(params[:text_id])
    if params[:literature][:document] == nil || params[:literature][:document] ==""
      flash[:alert] = "記事の保存に失敗しました。"
      @literature = Literature.new

    else
      @patch.literatures.create(document: params[:literature][:document])
      flash[:notice] = "記事の保存に成功しました。"
      @literature = Literature.new

    end
  end

  def text_patch_destroy
    @patch = Patch.find(params[:patch_id])
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


  def column_create
    @column = Column.find(params[:column_id])
    if params[:literature][:document] == nil || params[:literature][:document] ==""
      flash[:alert] = "記事の保存に失敗しました。"
      @literature = Literature.new
    else
      @column.literatures.create(document: params[:literature][:document])
      flash[:notice] = "記事の保存に成功しました。"
      @literature = Literature.new
    end
  end

  def column_destroy
    @column = Column.find(params[:column_id])
    literature = Literature.find(params[:id])
    if  literature.destroy
      flash[:notice] = "記事の削除に成功しました。"
      @literature = Literature.new
    else
      flash[:notice] = "記事の削除に失敗しました。"
      @literature = Literature.new
    end
  end
  private
  def literature_params
    params.require(:literature).permit(:subject_id, :subject_type, :document)
  end
end

