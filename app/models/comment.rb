class Comment < ApplicationRecord
  belongs_to :article, polymorphic: true
  belongs_to :speaker, polymorphic: true
  has_many :text_patch_orders, as: :content, dependent: :destroy
end
