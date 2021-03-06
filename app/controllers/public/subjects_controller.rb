class Public::SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user
  # subjectをAjaxで作成
  def create
    @problem = Problem.find(params[:problem_id])
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subject_problem_path(@problem)
      flash[:notice] = '記事の保存に成功しました。'
    else
      flash[:alert] = '記事の保存に失敗しました。'
      redirect_to subject_problem_path(@problem)
    end
  end

  # subjectをAjaxで消去
  def destroy
    @problem = Problem.find(params[:problem_id])
    @subject = Subject.find(params[:id])
    if @subject.destroy
      redirect_to subject_problem_path(@problem)
      flash[:notice] = '記事の保存に成功しました。'
    else
      flash[:alert] = '記事の保存に失敗しました。'
      render subject_problem_path(@problem)
    end
  end

  def ajax
    @problem = Problem.find(params[:problem_id])
    @text = Text.find(params[:text_id])
    @texts = Text.all
    @subject = Subject.new
  end

  private

  def subject_params
    params.require(:subject).permit(:text_id, :problem_id, :kind)
  end

  def ensure_correct_user
    author = Problem.find(params[:problem_id]).author
    return if author == current_user || author == current_admin

    redirect_to request.referer
    flash[:alert] = '他人のコラムは編集できません。'
  end
end
