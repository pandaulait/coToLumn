class Like < ApplicationRecord
  belongs_to :liked_content, polymorphic: true
  belongs_to :user

  # 通知機能
  has_one :activity, as: :target, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    case liked_content_type
    when 'Column'
      Activity.create(target: self, receiver: liked_content.user, action_type: :liked_to_own_column)
    when 'Patch'
      Activity.create(target: self, receiver: liked_content.user, action_type: :liked_to_own_patch)
    when 'Text'
      Activity.create(target: self, receiver: liked_content.admin, action_type: :liked_to_own_text)
    end
  end
end
