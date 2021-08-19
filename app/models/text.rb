class Text < ApplicationRecord
  belongs_to :admin
  attachment :image
  has_many :links, dependent: :destroy
  has_many :patches, dependent: :destroy
  has_many :literatures , as: :subject, dependent: :destroy

  has_many :subjects
  has_many :problems ,through: :subjects

  has_many :mathmatical_problems, -> { where "subject_status = 1" }, :through => :subjects, :source => "problem"
  has_many :japanese_problems, -> { where "subject_status = 2" }, :through => :subjects, :source => "problem"

  has_many :comments, as: :article, dependent: :destroy
  has_many :text_patch_orders, as: :content, dependent: :destroy
  has_many :likes, as: :liked_content, dependent: :destroy
  
  has_many :bookmarks, as: :marked_content, dependent: :destroy

end
