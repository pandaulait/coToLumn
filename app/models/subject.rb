class Subject < ApplicationRecord
  belongs_to :text
  belongs_to :problem
end
