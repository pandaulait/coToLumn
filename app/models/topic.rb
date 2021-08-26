class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :bookmarks, as: :marked_content, dependent: :destroy
end
