class Public::ColumnsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy, :link]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :link]

  def index
    @columns = Column.all.includes(:user, image_attachment: :blob).published.page(params[:page]).reverse_order
  end

  def show
    @column = Column.includes([:texts, { texts: [:admin, :image_attachment] }]).find(params[:id])
    @comments = @column.comments.includes(:speaker)
    # @liked_content = @column
    @comment = @column.comments.new if current_user.present? || current_admin.present?
  end

  def new
    @column = Column.new
    render layout: 'content_form'
  end

  def create
    @column = Column.new(column_params)
    @column.user_id = current_user.id
    if @column.save
      redirect_to columns_link_path(@column)
    else
      flash[:alert] = '記事の保存に失敗しました。'
      render :new
    end
  end

  def edit
    @column = Column.find(params[:id])
    @literature = Literature.new
    render layout: 'content_form'
  end

  def update
    column = Column.find(params[:id])
    if column.update(column_params)
      redirect_to column_path(column)
    else
      @column = column
      @literature = Literature.new
      render :edit
    end
  end

  def destroy
    @column = Column.find(params[:id])
    @column.destroy
    redirect_to columns_path
  end

  def link
    @column = Column.find(params[:id])
    @link = Link.new
    @texts = Text.all
    @text = Text.first
    @links = @column.links.includes([:text, { text: [:admin, :image_attachment] }])
    @literature = Literature.new
  end

  private

  def column_params
    params.require(:column).permit(:title, :body, :image, :status)
  end

  def ensure_correct_user
    user = Column.find(params[:id]).user
    return if user == current_user

    redirect_to request.referer
    flash[:alert] = '他人のコラムは編集できません。'
  end
end
