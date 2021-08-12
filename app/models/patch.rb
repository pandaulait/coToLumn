class Patch < ApplicationRecord
  belongs_to :text
  attachment :image
  belongs_to :user
  has_many :literatures , as: :subject, dependent: :destroy
end
