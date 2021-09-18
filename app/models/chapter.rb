class Chapter < ApplicationRecord
  belongs_to :textbook_list
  belongs_to :grade
  has_many :sections, dependent: :destroy
  validates :body, presence: true
  validates :number, presence: true

end
