class Column < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  enum status: { draft: 0,
                 published: 1,
                 unpublished: 2 }

  belongs_to :user
  has_one_attached :image
  has_many :links, dependent: :destroy
  has_many :texts, through: :links, dependent: :destroy

  has_many :literatures, as: :subject, dependent: :destroy
  has_many :comments, as: :article, dependent: :destroy
  has_many :text_patch_orders, as: :content, dependent: :destroy

  # いいね機能
  has_many :likes, as: :liked_content, dependent: :destroy

  has_many :professional_likes, -> { where 'category = 1' }, as: :liked_content, class_name: 'Like', dependent: :destroy
  has_many :scientifically_likes, -> { where 'category = 2' }, as: :liked_content, class_name: 'Like', dependent: :destroy
  has_many :logical_likes, -> { where 'category = 3' }, as: :liked_content, class_name: 'Like', dependent: :destroy
  has_many :dislikes, -> { where 'category = 4' }, as: :liked_content, class_name: 'Like', dependent: :destroy

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

  def self.search(keyword)
    where(['title like? OR body like?', "%#{keyword}%", "%#{keyword}%"])
  end

  # scope :published, -> { where(status: published) }
end
