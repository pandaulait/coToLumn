class Public::LiteraturesController < ApplicationController

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
      flash[:notice] = "記事の保存に成功しました。"
    else
      flash[:alert] = "記事の保存に失敗しました。"
    end
    @literature = Literature.new
  end

  def text_patch_destroy
    @patch = Patch.find(params[:patch_id])
    @text = Text.find(params[:text_id])
    literature = Literature.find(params[:id])
    if  literature.destroy
      flash[:notice] = "記事の削除に成功しました。"
    else
      flash[:notice] = "記事の削除に失敗しました。"
    end
    @literature = Literature.new
  end


  def column_create
    @column = Column.find(params[:column_id])
    literature = @column.literatures.new(literature_params)
    if literature.save
      flash[:notice] = "記事の保存に成功しました。"
    else
      flash[:alert] = "記事の保存に失敗しました。"
    end
    @literature = Literature.new
  end
  
 
  

  def column_destroy
    @column = Column.find(params[:column_id])
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

