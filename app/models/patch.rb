class Patch < ApplicationRecord
  belongs_to :text
  attachment :image
  belongs_to :user
end
