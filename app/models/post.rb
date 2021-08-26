class Post < ApplicationRecord
  belongs_to :parent, class_name: 'Post', foreign_key: :parent_id, optional: true
  has_many :children, class_name: 'Post', foreign_key: :parent_id

  belongs_to :topic
  belongs_to :user
end
