class Problem < ApplicationRecord
  belongs_to :author, polymorphic: true
  has_many :subjects
end
