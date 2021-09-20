class Public::TextsController < ApplicationController
  def index
    @texts = Text.all.includes(:admin, :image_attachment, patches: :user).published.page(params[:page]).reverse_order
  end

  def show
    @user = current_user
    @text = Text.includes(patches: :user).find(params[:id])
    @columns = @text.columns.includes(:user, :literatures, image_attachment: :blob)
    @comments = @text.comments.includes(:speaker)
    @problems = @text.problems.includes(:author)
    @comment = @text.comments.new if current_user.present? || current_admin.present?
  end
end
