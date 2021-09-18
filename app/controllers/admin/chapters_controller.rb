class Admin::ChaptersController < ApplicationController
  # before_action :authenticate_admin!
  # before_action :ensure_correct_user, only: [:create, :destroy]
  # def create
  #   @text = Text.find(params[:text_id])
  #   chapter = @text.chapters.new(chapter_params)
  #   if chapter.save
  #     @chapter = Chapter.new
  #     redirect_to edit_admin_text_path(@text)
  #   else
  #     @literature = Literature.new
  #     @chapter = chapter
  #     @chapters = @text.chapters
  #     render 'admin/texts/edit'
  #   end
  # end

  # def destroy
  #   @text = Text.find(params[:text_id])
  #   chapter = Chapter.find(params[:id])
  #   flash[:alert] = 'chapterの削除に成功しました。' if chapter.destroy
  #   redirect_to edit_admin_text_path(@text)
  # end

  # private

  # def chapter_params
  #   params.require(:chapter).permit(:status, :body, :section, :grade, :subject)
  # end

  # # 他人の記事を編集しないよう
  # def ensure_correct_user
  #   admin = Text.find(params[:text_id]).admin
  #   return if admin == current_admin

  #   redirect_to request.referer
  #   flash[:alert] = '他人の記事の編集はできません。'
  # end
end
