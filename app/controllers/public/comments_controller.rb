class Public::CommentsController < ApplicationController
  def create
    if current_user.present?
      comment = current_user.comments.new(comment_params)
    elsif current_admin.present?
      comment = current_admin.comments.new(comment_params)
    end
    if comment.save
      flash[:notice] = "記事の保存に成功しました。"
    else
      flash[:alert] = "記事の保存に失敗しました。"
    end

    # 各記事タイプに合わせてコメントの準備
    if comment.article_type == "Text" # text
      @article = Text.find(comment.article_id.to_i)
    elsif comment.article_type == "Column" # column
      @article = Column.find(comment.article_id.to_i)
    elsif comment.article_type == "Patch" # patch
      @article = Patch.find(comment.article_id.to_i)
    end
    @comments = @article.comments
    @comment = @article.comments.new
  end

  def destroy
    comment = Comment.find(params[:id])
    # 各記事タイプに合わせてコメントの準備
    if comment.article_type == "Text" # text
      @article = Text.find(comment.article_id.to_i)
    elsif comment.article_type == "Column" # column
      @article = Column.find(comment.article_id.to_i)
    elsif comment.article_type == "Patch" # patch
      @article = Patch.find(comment.article_id.to_i)
    end
    @comments = @article.comments
    @comment = @article.comments.new
    if comment.destroy
      flash[:notice] = "記事の削除に成功しました。"
    else
      flash[:alert] = "記事の削除に失敗しました。"
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id, :article_type)
  end
end
