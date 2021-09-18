class Grade < ApplicationRecord
  has_many :chapters, dependent: :destroy
end
