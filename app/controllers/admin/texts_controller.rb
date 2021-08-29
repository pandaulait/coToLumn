class Admin::TextsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_correct_user, only: [:edit,:update,:destroy]
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
    @chapter = Chapter.new
    render :layout => 'content_form'
  end

  def create
    @text = Text.new(text_params)
    @text.admin_id = current_admin.id
    if @text.save
      redirect_to edit_admin_text_path(@text)
      flash[:notice] = "記事の保存に成功しました。次はチャプターと参考文献を設定しましょう。"
    else
      render :new
    end
  end

  def edit
    @text = Text.find(params[:id])
    @literature = Literature.new
    @chapter = Chapter.new
    @chapters = @text.chapters
    render :layout => 'content_form'
  end

  def update
    text = Text.find(params[:id])
    if text.update(text_params)
      redirect_to text_path(text)
      flash[:notice] = "記事の保存に成功しました。"
    else
      @text = text
      @literature = Literature.new
      @chapter = Chapter.new
      @chapters = @text.chapters
      render :edit
    end
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy
    redirect_to admin_texts_path
  end

  private

  def text_params
    params.require(:text).permit(:title, :body, :image, :published)
  end

  def ensure_correct_user
    admin = Text.find(params[:id]).admin
    unless admin == current_admin
      redirect_to request.referer
      flash[:alert] = "他人の記事の編集はできません。"
    end
  end
end
