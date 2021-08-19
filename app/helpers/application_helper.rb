module ApplicationHelper
  # 通知ごとに飛ばすパス指定
  def transition_path(activity)
    case activity.action_type.to_sym
    when :commented_to_own_column
      column_path(activity.target.article, anchor: "js-comment-#{activity.target.id}")
    when :liked_to_own_column
      column_path(activity.target.liked_content)
    when :bookmarked_to_own_column
      column_path(activity.target.marked_content)
    when :commented_to_own_patch
      text_patch_path(activity.target.article.text, activity.target.article, anchor: "js-comment-#{activity.target.id}")
    when :liked_to_own_patch
      text_patch_path(activity.target.liked_content.text, activity.target.liked_content)
    when :bookmarked_to_own_patch
      text_patch_path(activity.target.marked_content.text, activity.target.marked_content)
    when :followed_me
      user_path(activity.target.follower)
    end
  end

end
