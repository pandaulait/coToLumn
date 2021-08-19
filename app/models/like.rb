class Like < ApplicationRecord
  belongs_to :liked_content, polymorphic: true
  belongs_to :user

  # 通知機能
  has_one :activity, as: :target, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    if self.liked_content_type == "Column"
      Activity.create(target: self, user: self.liked_content.user, action_type: :liked_to_own_column)
    elsif self.liked_content_type == "Patch"
      Activity.create(target: self, user: self.liked_content.user, action_type: :liked_to_own_patch)
    end
  end
end
