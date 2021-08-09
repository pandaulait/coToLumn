class Text < ApplicationRecord
  belongs_to :admin
  attachment :image
  has_many :links, dependent: :destroy    
  has_many :patches, dependent: :destroy    
end
