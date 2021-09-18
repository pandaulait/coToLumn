class TextbookList < ApplicationRecord
  belongs_to :subject_area
  has_many :chapters, dependent: :destroy
end
