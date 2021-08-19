class Problem < ApplicationRecord
  belongs_to :author, polymorphic: true
  has_many :subjects
  has_many :bookmarks, as: :marked_content, dependent: :destroy
end
