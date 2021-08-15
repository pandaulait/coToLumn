class Comment < ApplicationRecord
  belongs_to :article, polymorphic: true
  belongs_to :speaker, polymorphic: true
end
