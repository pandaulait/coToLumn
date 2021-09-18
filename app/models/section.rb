class Section < ApplicationRecord
  belongs_to :chapter
  belongs_to :text
  validates :number, presence: true
end
