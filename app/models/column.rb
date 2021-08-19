class Column < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :links, dependent: :destroy
  has_many :literatures , as: :subject, dependent: :destroy
  has_many :comments, as: :article, dependent: :destroy
  has_many :text_patch_orders, as: :content, dependent: :destroy
  has_many :likes, as: :liked_content, dependent: :destroy


  #いいね機能
  has_many :professional_likes, -> { where "category = 1" }, as: :liked_content, class_name: "Like"
  has_many :scientifically_likes, -> { where "category = 2" }, as: :liked_content, class_name: "Like"
  has_many :logical_likes, -> { where "category = 3" }, as: :liked_content, class_name: "Like"
  has_many :dislikes, -> { where "category = 4" }, as: :liked_content, class_name: "Like"

  def professional_liked_by?(user)
    likes.where(user_id: user.id, category: 1).exists?
  end
  def scientifically_liked_by?(user)
    likes.where(user_id: user.id, category: 2).exists?
  end
  def logical_liked_by?(user)
    likes.where(user_id: user.id, category: 3).exists?
  end
  def disliked_by?(user)
    likes.where(user_id: user.id, category: 4).exists?
  end
  # ブックマーク機能
  has_many :bookmarks, as: :marked_content, dependent: :destroy
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
