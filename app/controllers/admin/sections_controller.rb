class Admin::SectionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_correct_user, only: [:create, :destroy]
  def ajax1
    @text = Text.find(params[:text_id])
    subject = SubjectArea.find(params[:subject])
    @textbook_lists = subject.textbook_lists
  end

  def ajax2
    @text = Text.find(params[:text_id])
    @textbook_list = TextbookList.find(params[:textbook_list])
    @chapters = @textbook_list.chapters
  end

  def ajax3
    @text = Text.find(params[:text_id])
    @chapter = Chapter.find(params[:chapter])
    @section = @chapter.sections.new
  end

  def create
    @text = Text.find(params[:text_id])
    section = @text.sections.new(section_params)
    if section.save
      redirect_to edit_admin_text_path(@text)
    else
      @literature = Literature.new
      @section = section
      @subjects = SubjectArea.all
      @sections = @text.sections
      render 'admin/texts/edit'
    end
  end

  private

  def section_params
    params.require(:section).permit(:number, :chapter_id)
  end

  def ensure_correct_user
    admin = Text.find(params[:text_id]).admin
    return if admin == current_admin

    redirect_to request.referer
    flash[:alert] = '他人の記事の編集はできません。'
  end
end
