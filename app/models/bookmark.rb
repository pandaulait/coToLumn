class Bookmark < ApplicationRecord
  belongs_to :marked_content, polymorphic: true
  belongs_to :user

  # 通知機能
  has_one :activity, as: :target, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    case marked_content_type
    when 'Column'
      Activity.create(target: self, receiver: marked_content.user, action_type: :bookmarked_to_own_column)
    when 'Patch'
      Activity.create(target: self, receiver: marked_content.user, action_type: :bookmarked_to_own_patch)
    when 'Text'
      Activity.create(target: self, receiver: marked_content.admin, action_type: :bookmarked_to_own_text)
    end
  end
end
