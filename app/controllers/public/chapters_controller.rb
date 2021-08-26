class Public::ChaptersController < ApplicationController
  def create
    @text = Text.find(params[:text_id])
    chapter = @text.chapters.new(chapter_params)
    chapter.save
    @chapter = Chapter.new
    redirect_to edit_admin_text_path(@text)
  end

  def destroy
    @text = Text.find(params[:text_id])
    chapter = Chapter.find(params[:id])
    if chapter.destroy
      flash[:alert] = "chapterの削除に成功しました。"
    end
    redirect_to edit_admin_text_path(@text)
  end

  private
  def chapter_params
    params.require(:chapter).permit(:status, :body, :section)
  end
end
