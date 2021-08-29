class Post < ApplicationRecord
  belongs_to :parent, class_name: 'Post', foreign_key: :parent_id, optional: true, dependent: :destroy
  has_many :children, class_name: 'Post', foreign_key: :parent_id, dependent: :destroy

  belongs_to :topic
  belongs_to :user
end
