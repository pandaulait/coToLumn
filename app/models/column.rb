class Column < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :links, dependent: :destroy    
end
