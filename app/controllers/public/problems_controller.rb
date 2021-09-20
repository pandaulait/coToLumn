class Public::ProblemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy, :subject]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :subject]

  def index
    @problems = Problem.all.includes(:author).published.page(params[:page]).reverse_order
  end

  def show
    @problem = Problem.includes([:texts, { texts: [:admin, :image_attachment] }]).find(params[:id])
  end

  def new
    @problem = Problem.new
  end

  def create
    user = current_user
    @problem = user.problems.new(problem_params)
    if @problem.save
      redirect_to subject_problem_path(@problem)
    else
      flash[:alert] = '記事の保存に失敗しました。'
      render :new
    end
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    problem = Problem.find(params[:id])
    if problem.update(problem_params)
      redirect_to problem_path(problem)
    else
      @problem = problem
      render :edit
    end
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to problems_path
  end

  def subject
    @texts = Text.all
    @text = Text.first
    @problem = Problem.find(params[:id])
    @subjects = @problem.subjects.includes([:text, { text: [:admin, :image_attachment] }])
    @subject = Subject.new
  end

  private

  def problem_params
    params.require(:problem).permit(:author_id, :author_type, :body, :answer, :commentary, :status, :subject_status)
  end

  def ensure_correct_user
    author = Problem.find(params[:id]).author
    return if author == current_user || author == current_admin

    redirect_to request.referer
    flash[:alert] = '他人のコラムは編集できません。'
  end
end
