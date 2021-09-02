class Relationship < ApplicationRecord
  belongs_to :followed, class_name: 'User'
  belongs_to :follower, class_name: 'User'
  # 通知機能
  has_one :activity, as: :target, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    Activity.create(target: self, receiver: followed, action_type: :followed_me)
  end
end
