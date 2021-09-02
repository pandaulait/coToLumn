class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_not_own_user, only: [:create]
  def index
    @bookmarks = current_user.bookmarks
    @user = current_user
  end

  def create
    bookmark = Bookmark.new(bookmark_params)
    bookmark.user_id = current_user.id
    flash[:alert] = '記事の保存に失敗しました。' unless bookmark.save
    case bookmark.marked_content_type
    when 'Text'
      @marked_content = Text.find(bookmark.marked_content_id)
    when 'Column'
      @marked_content = Column.find(bookmark.marked_content_id)
    when 'Topic'
      @marked_content = Topic.find(bookmark.marked_content_id)
    when 'Patch'
      @marked_content = Patch.find(bookmark.marked_content_id)
    when 'Problem'
      @marked_content = Problem.find(bookmark.marked_content_id)
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    case bookmark.marked_content_type
    when 'Text'
      @marked_content = Text.find(bookmark.marked_content_id)
    when 'Column'
      @marked_content = Column.find(bookmark.marked_content_id)
    when 'Topic'
      @marked_content = Topic.find(bookmark.marked_content_id)
    when 'Patch'
      @marked_content = Patch.find(bookmark.marked_content_id)
    when 'Problem'
      @marked_content = Problem.find(bookmark.marked_content_id)
    end
    bookmark.destroy
  end

  private

  def ensure_not_own_user
    bookmark = Bookmark.new(bookmark_params)
    case bookmark.marked_content_type
    when 'Column'
      marked_user = Column.find(bookmark.marked_content_id).user
    when 'Patch'
      marked_user = Patch.find(bookmark.marked_content_id).user
    when 'Topic'
      marked_user = Topic.find(bookmark.marked_content_id).user
    when 'Problem'
      marked_user = Problem.find(bookmark.marked_content_id).author
    end
    return if marked_user != current_user

    redirect_to request.referer
    flash[:alert] = '自分の記事はブックマークできません。'
  end

  def bookmark_params
    params.permit(:marked_content_id, :marked_content_type)
  end
end
