class Public::ColumnsController < ApplicationController
  def index
    @columns = Column.all
  end

  def show
    @column = Column.find(params[:id])
  end

  def new
    @column = Column.new
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
  end

  def update
    column = Column.find(params[:id])
    column.update(column_params)
    redirect_to column_path(column)
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
end

