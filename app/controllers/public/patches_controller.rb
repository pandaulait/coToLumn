class Public::PatchesController < ApplicationController
  def index
    @text = Text.find(params[:text_id])
    @patches = @text.patches
  end

  def show
    @text = Text.find(params[:text_id])
    @patch = Patch.find(params[:id])
    @literature = Literature.new
    @comments = @patch.comments
    @comment = @patch.comments.new
    @orders = @patch.text_patch_orders.order(order: "ASC")
  end

  def new
    @text = Text.find(params[:text_id])
    @patch = Patch.new
    @patch.image_id = @text.image_id
    @patch.title = @text.title
    @patch.body  = @text.body
  end

  def create
    @patch = Patch.new(patch_params)
    @patch.user_id = current_user.id
    @patch.text_id = params[:text_id]
    if @patch.save
      redirect_to text_patch_literatures_path(params[:text_id],@patch)
    else
      flash[:alert] = "記事の保存に失敗しました。"
      render :new
    end
  end

  def edit
    @text = Text.find(params[:text_id])
    @patch = Patch.find(params[:id])
    @literature = Literature.new
  end

  def update
    patch = Patch.find(params[:id])
    if patch.update(patch_params)
      flash[:notice] = "記事の保存に成功しました。"
      redirect_to text_patch_path(params[:text_id],patch)
    else
      flash[:alert] = "記事の 更新に失敗しました。"
      render :edit
    end

  end

  def destroy
    @patch = Patch.find(params[:id])
    if @patch.destroy
      flash[:notice] = "記事の保存に成功しました。"
      redirect_to text_patches_path
    else
      flash[:alert] = "記事の削除に失敗しました。"
      render :show
    end
  end

  private
  def patch_params
    params.require(:patch).permit(:title, :body, :image, :is_draft)
  end

end
