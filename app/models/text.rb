class Text < ApplicationRecord
  belongs_to :admin
  attachment :image
end
