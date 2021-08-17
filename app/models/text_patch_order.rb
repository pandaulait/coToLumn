class TextPatchOrder < ApplicationRecord
  belongs_to :content, polymorphic: true
  belongs_to :patch
end
