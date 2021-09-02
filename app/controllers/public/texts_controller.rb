class Public::TextsController < ApplicationController
  def index
    @texts = Text.all.published
  end

  def show
    @user = current_user
    @text = Text.find(params[:id])
    @links = @text.links
    @comments = @text.comments
    @problems = @text.problems
    @comment = @text.comments.new if current_user.present? || current_admin.present?
  end
end
