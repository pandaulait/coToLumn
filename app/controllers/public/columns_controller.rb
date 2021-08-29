class Public::ColumnsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy, :link]
  before_action :ensure_correct_user, only: [:edit,:update,:destroy, :link]

  def index
    @columns = Column.all
  end

  def show
    @column = Column.find(params[:id])
    @comments = @column.comments
    @liked_content = @column
    if current_user.present? || current_admin.present?
      @comment = @column.comments.new
    end
  end

  def new
    @column = Column.new
    render :layout => 'content_form'
  end

  def create
    @column = Column.new(column_params)
    @column.user_id = current_user.id
    if @column.save
      redirect_to columns_link_path(@column)
    else
      flash[:alert] = "記事の保存に失敗しました。"
      render :new
    end
  end

  def edit
    @column = Column.find(params[:id])
    @literature = Literature.new
    render :layout => 'content_form'
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
    @links = @column.links
    @literature = Literature.new
  end

  private
  def column_params
    params.require(:column).permit(:title, :body, :image, :status)
  end

  def ensure_correct_user
    user = Column.find(params[:id]).user
    unless user == current_user
      redirect_to request.referer
      flash[:alert] = "他人のコラムは編集できません。"
    end
  end
end

