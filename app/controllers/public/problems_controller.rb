class Public::ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def new
    @problem = Problem.new
  end

  def create
    user = current_user
    @problem = user.problems.new(problem_params)
    if @problem.save
      redirect_to problem_path(@problem)
    else
      flash[:alert] = "記事の保存に失敗しました。"
      render :new
    end
  end

  def edit
    @problem = Problem.find(params[:id])


  end

  def update
    problem = Problem.find(params[:id])
    problem.update(problem_params)
    redirect_to problem_path(problem)
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to problems_path
  end

  private
  def problem_params
    params.require(:problem).permit(:author_id, :author_type, :body, :answer, :commentary, :status)
  end
end
