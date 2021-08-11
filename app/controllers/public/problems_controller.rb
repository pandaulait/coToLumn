class Public::ProblemsController < ApplicationController
  def index
    @texts = Text.all
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
    @text = Text.find(params[:id])
    @literature = Literature.new

  end

  def update
    text = Text.find(params[:id])
    text.update(text_params)
    redirect_to admin_text_path(text)
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy
    redirect_to admin_texts_path
  end

  private
  def problem_params
    params.require(:problem).permit(:author_id, :author_type, :body, :answer, :commentary, :status)
  end
end
