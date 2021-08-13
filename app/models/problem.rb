class Problem < ApplicationRecord
  belongs_to :author, polymorphic: true
end
