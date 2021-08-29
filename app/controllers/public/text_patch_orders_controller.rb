class Public::TextPatchOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user
  def new
    @patch = Patch.find(params[:patch_id])
    @text = Text.find(params[:text_id])
    @order = TextPatchOrder.new
    @orders = @patch.text_patch_orders.order(order: "ASC")
  end

  def ajax1
    @patch = Patch.find(params[:patch_id])
    @text = Text.find(params[:text_id])
    @order = TextPatchOrder.new(order_params)
    @order.patch_id = @patch.id
    session[:text_patch_order] = @order
    if session[:text_patch_order]["content_type"] == "Text"
      @contents = Text.all
    elsif  session[:text_patch_order]["content_type"] == "Column"
      @contents = Column.all
    elsif  session[:text_patch_order]["content_type"] == "Problem"
      @contents = Problem.all
    elsif  session[:text_patch_order]["content_type"] == "Comment"
      @contents = Comment.all
    end
  end

  def ajax2
    @patch = Patch.find(params[:patch_id])
    @text = Text.find(params[:text_id])
    @order = TextPatchOrder.new(order_params)
    session[:text_patch_order]["content_id"] = @order.content_id
    @order.content_type = session[:text_patch_order]["content_type"]
    if session[:text_patch_order]["content_type"] == "Text"
      @content = Text.find(@order.content_id)
      @contents = Text.all
    elsif  session[:text_patch_order]["content_type"] == "Column"
      @content = Column.find(@order.content_id)
      @contents = Column.all
    elsif  session[:text_patch_order]["content_type"] == "Problem"
      @content = Problem.find(@order.content_id)
      @contents = Problem.all
    elsif  session[:text_patch_order]["content_type"] == "Comment"
      @content = Comment.find(@order.content_id)
      @contents = Comment.all
    end
  end

  def create
    order =TextPatchOrder.new(session[:text_patch_order])
    @text = Text.find(params[:text_id])
    @patch = Patch.find(params[:patch_id])
    max = TextPatchOrder.maximum(:order)
    if max.nil?
      order.order = 1
    else
      order.order = max + 1
    end
    order.save
    redirect_to new_text_patch_order_path(@text,@patch)
  end

  def destroy
    order = TextPatchOrder.find(params[:id])
    @text = Text.find(params[:text_id])
    @patch = Patch.find(params[:patch_id])
    if order.destroy
      flash[:notice] = "結びつきの解除に成功しました。"
      orders = @patch.text_patch_orders.order(order: "ASC")
      i = 1
      orders.each do |order|
        if order.update(order: i)
          i = i + 1
          flash[:notice1] = "番号を振り替えました"
        end
      end
    else
      flash[:alert] = "結びつきの解除に失敗しました。"
    end
    redirect_to new_text_patch_order_path(@text,@patch)
  end


  def edit
  end
  private
  def order_params
     params.require(:text_patch_order).permit(:content_type, :content_id, :order, :patch_id)
  end

  def ensure_correct_user
    user = Patch.find(params[:patch_id]).user
    unless user == current_user
      redirect_to request.referer
      flash[:alert] = "他人の記事の編集はできません。"
    end
  end
end
