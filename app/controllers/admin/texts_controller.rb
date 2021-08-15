class Admin::TextsController < ApplicationController
  def index
    @texts = Text.all
  end

  def show
    @text = Text.find(params[:id])
    @comments = @text.comments
    if current_user.present? || current_admin.present?
      @comment = @text.comments.new
    end
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    @text.admin_id = current_admin.id
    if @text.save
      redirect_to admin_text_path(@text)
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
  def text_params
    params.require(:text).permit(:title, :body, :image, :is_draft)
  end
end
