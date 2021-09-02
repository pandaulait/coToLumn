class Public::PatchesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def index
    @text = Text.find(params[:text_id])
    @patches = @text.patches.published
  end

  def show
    @text = Text.find(params[:text_id])
    @patch = Patch.find(params[:id])
    @literature = Literature.new
    @comments = @patch.comments
    @comment = @patch.comments.new
    @orders = @patch.text_patch_orders.order(order: 'ASC')
  end

  def new
    @text = Text.find(params[:text_id])
    @patch = Patch.new
    @patch.image = @text.image
    @patch.title = @text.title
    @patch.body  = @text.body
    render layout: 'content_form'
  end

  def create
    @patch = Patch.new(patch_params)
    @patch.user_id = current_user.id
    @patch.text_id = params[:text_id]
    if @patch.save
      redirect_to text_patch_literatures_path(params[:text_id], @patch)
      flash[:notice] = '記事の保存に成功しました。'
    else
      flash[:alert] = '記事の保存に失敗しました。'
      render :new
    end
  end

  def edit
    @text = Text.find(params[:text_id])
    @patch = Patch.find(params[:id])
    @literature = Literature.new
    render layout: 'content_form'
  end

  def update
    patch = Patch.find(params[:id])
    if patch.update(patch_params)
      flash[:notice] = '記事の更新に成功しました。'
      redirect_to text_patch_path(params[:text_id], patch)
    else
      flash[:alert] = '記事の 更新に失敗しました。'
      @text = Text.find(params[:text_id])
      @patch = patch
      @literature = Literature.new
      render :edit
    end
  end

  def destroy
    @patch = Patch.find(params[:id])
    if @patch.destroy
      flash[:notice] = '記事の保存に成功しました。'
      redirect_to text_patches_path
    else
      flash[:alert] = '記事の削除に失敗しました。'
      render :show
    end
  end

  private

  def patch_params
    params.require(:patch).permit(:title, :body, :image, :status)
  end

  def ensure_correct_user
    user = Patch.find(params[:id]).user
    return if user == current_user

    redirect_to request.referer
    flash[:alert] = '他人の記事の編集はできません。'
  end
end
