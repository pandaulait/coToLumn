class Bookmark < ApplicationRecord
  belongs_to :marked_content, polymorphic: true
  belongs_to :user
end
