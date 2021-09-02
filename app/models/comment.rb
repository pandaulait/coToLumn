class Comment < ApplicationRecord
  belongs_to :article, polymorphic: true
  belongs_to :speaker, polymorphic: true
  has_many :text_patch_orders, as: :content, dependent: :destroy

  # 通知機能
  has_one :activity, as: :target, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    case article_type
    when 'Column'
      Activity.create(target: self, receiver: article.user, action_type: :commented_to_own_column)
    when 'Patch'
      Activity.create(target: self, receiver: article.user, action_type: :commented_to_own_patch)
    when 'Text'
      Activity.create(target: self, receiver: article.admin, action_type: :commented_to_own_text)
    end
  end
end
