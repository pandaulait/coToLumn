class Chapter < ApplicationRecord
  belongs_to :text
  validates :body, presence: true
  validates :section, presence: true
  validates :status, presence: true
end
