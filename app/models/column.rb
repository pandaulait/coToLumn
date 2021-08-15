class Column < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :links, dependent: :destroy
  has_many :literatures , as: :subject, dependent: :destroy
  has_many :comments, as: :article, dependent: :destroy
end
