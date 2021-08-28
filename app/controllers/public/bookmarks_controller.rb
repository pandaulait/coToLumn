class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_not_own_user, only: [:create]
  def index
    @bookmarks = current_user.bookmarks
    @user = current_user

  end


  def create
    bookmark = Bookmark.new(bookmark_params)
    bookmark.user_id =current_user.id
    unless bookmark.save
      flash[:alert] = "記事の保存に失敗しました。"
    end
    if bookmark.marked_content_type == "Text" # text
      @marked_content = Text.find(bookmark.marked_content_id)
    elsif bookmark.marked_content_type == "Column" # column
      @marked_content = Column.find(bookmark.marked_content_id)
    elsif bookmark.marked_content_type == "Patch" # patch
      @marked_content = Patch.find(bookmark.marked_content_id)
    elsif bookmark.marked_content_type == "Topic" # patch
      @marked_content = Topic.find(bookmark.marked_content_id)
    elsif bookmark.marked_content_type == "Problem" # patch
      @marked_content = Problem.find(bookmark.marked_content_id)
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    if bookmark.marked_content_type == "Text" # text
      @marked_content = Text.find(bookmark.marked_content_id)
    elsif bookmark.marked_content_type == "Column" # column
      @marked_content = Column.find(bookmark.marked_content_id)
    elsif bookmark.marked_content_type == "Patch" # patch
      @marked_content = Patch.find(bookmark.marked_content_id)
    elsif bookmark.marked_content_type == "Topic" # patch
      @marked_content = Topic.find(bookmark.marked_content_id)
    elsif bookmark.marked_content_type == "Problem" # patch
      @marked_content = Problem.find(bookmark.marked_content_id)
    end
    bookmark.destroy
  end

  private
  
  def ensure_not_own_user
    bookmark = Bookmark.new(bookmark_params)
    if bookmark.marked_content_type == "Column" # column
      marked_user = Column.find(bookmark.marked_content_id).user
    elsif bookmark.marked_content_type == "Patch" # patch
      marked_user = Patch.find(bookmark.marked_content_id).user
    elsif bookmark.marked_content_type == "Topic" # patch
      marked_user = Topic.find(bookmark.marked_content_id).user
    elsif bookmark.marked_content_type == "Problem" # patch
      marked_user = Problem.find(bookmark.marked_content_id).author
    end
    if marked_user == current_user
      redirect_to request.referer
      flash[:alert] = "自分の記事はブックマークできません。"
    end
  end
  def bookmark_params
    params.permit(:marked_content_id, :marked_content_type)
  end
end
