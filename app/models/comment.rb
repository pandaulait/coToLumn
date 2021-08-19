class Comment < ApplicationRecord
  belongs_to :article, polymorphic: true
  belongs_to :speaker, polymorphic: true
  has_many :text_patch_orders, as: :content, dependent: :destroy
  
  
  # 通知機能
  has_one :activity, as: :target, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    if self.article_type =="Column"
      Activity.create(target: self, user: self.article.user, action_type: :commented_to_own_column)
    elsif self.article_type =="Patch"
      Activity.create(target: self, user: self.article.user, action_type: :commented_to_own_patch)
    end
  end
end
