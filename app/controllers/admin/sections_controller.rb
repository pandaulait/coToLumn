class Admin::SectionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_correct_user, only: [:create, :destroy]
  def ajax1
    # 教科を選択し、学年を選ぶ
    @text = Text.find(params[:text_id])
    @subject = SubjectArea.find(params[:subject])
    @grades = Grade.all
  end

  def ajax2
    # 教科、学年を選択し、教科書を選ぶ
    @text = Text.find(params[:text_id])
    @subject = SubjectArea.find(params[:subject])
    @grade = Grade.find(params[:grade])
    @textbook_lists = @grade.textbook_lists.where(subject_area_id: @subject.id).uniq

  end

  def ajax3
    # 教科、学年、教科書を選び、章を選ぶ
    @text = Text.find(params[:text_id])
    @textbook_list = TextbookList.find(params[:textbook_list])
    @chapters = @textbook_list.chapters.where(grade_id: params[:grade])
  end

  def ajax4
    # 教科、学年、教科書、章を選び、節を作成する
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
  def destroy
    @text = Text.find(params[:text_id])
    section = Section.find(params[:id])
    flash[:alert] = '節の削除に成功しました。' if section.destroy
    redirect_to edit_admin_text_path(@text)
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
