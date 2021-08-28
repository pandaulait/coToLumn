class Literature < ApplicationRecord

  belongs_to :subject, polymorphic: true

  validates :subject_id, presence: true
  validates :subject_type, presence: true
  validates :document, presence: true
end
