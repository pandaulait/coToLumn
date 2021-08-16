class Patch < ApplicationRecord
  belongs_to :text
  attachment :image
  belongs_to :user
  has_many :literatures, as: :subject, dependent: :destroy
  has_many :comments, as: :article, dependent: :destroy
  has_many :text_patch_orders, dependent: :destroy
end
