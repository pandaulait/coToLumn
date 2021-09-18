class SubjectArea < ApplicationRecord
  has_many :textbook_lists, dependent: :destroy
end
