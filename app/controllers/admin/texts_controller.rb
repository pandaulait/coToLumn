class Admin::TextsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_correct_admin, only: [:edit, :update, :destroy]
  before_action :ensure_normal_admin, only: [:status]
  def index
    @texts = Text.all
  end

  def show
    @text = Text.find(params[:id])
    @comments = @text.comments
    @comment = @text.comments.new if current_user.present? || current_admin.present?
  end

  def new
    @text = Text.new
    @chapter = Chapter.new
    render layout: 'content_form'
  end

  def create
    @text = Text.new(text_params)
    @text.admin_id = current_admin.id
    if @text.save
      redirect_to edit_admin_text_path(@text)
      flash[:notice] = '記事の保存に成功しました。次はチャプターと参考文献を設定しましょう。'
    else
      render :new
    end
  end

  def edit
    @text = Text.find(params[:id])
    @literature = Literature.new
    @chapter = Chapter.new
    @chapters = @text.chapters
    render layout: 'content_form'
  end

  def update
    text = Text.find(params[:id])
    if text.update(text_params)
      redirect_to text_path(text)
      flash[:notice] = '記事の保存に成功しました。'
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

  def status
    text = Text.find(params[:text_id])
    if text.update(text_params)
      flash[:notice] = '記事の更新に成功しました。'
    else
      flash[:alert] = '記事の更新に失敗しました。'
    end
    redirect_to request.referer
  end

  private

  def text_params
    params.require(:text).permit(:title, :body, :image, :status)
  end

  def ensure_correct_admin
    admin = Text.find(params[:id]).admin
    return if admin == current_admin

    redirect_to request.referer
    flash[:alert] = '他人の記事の編集はできません。'
  end

  def ensure_normal_admin
    return if current_admin.email != 'example@example.com'

    flash[:alert] = 'ゲスト管理者権限では、ステータスの変更はできません。'
    redirect_to request.referer
  end
end
