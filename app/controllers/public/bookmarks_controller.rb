class Public::BookmarksController < ApplicationController
  def index
  end


  def create
    bookmark = Bookmark.new(bookmark_params)
    bookmark.user_id =current_user.id
    if bookmark.save
      flash[:notice] = "記事の保存に成功しました。"
    else
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
    end
    bookmark.destroy
  end

  private
  def bookmark_params
    params.permit(:marked_content_id, :marked_content_type)
  end
end
