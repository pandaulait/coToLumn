class Like < ApplicationRecord
  belongs_to :liked_content, polymorphic: true
  belongs_to :user
end
