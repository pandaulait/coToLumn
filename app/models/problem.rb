class Problem < ApplicationRecord
  validates :subject_status, presence: true
  validates :answer, presence: true
  validates :body, length: { minimum: 5 }
  belongs_to :author, polymorphic: true
  has_many :subjects
  has_many :bookmarks, as: :marked_content, dependent: :destroy
end
