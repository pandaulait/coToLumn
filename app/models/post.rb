class Post < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :parent, class_name: 'Post', foreign_key: :parent_id, optional: true, dependent: :destroy
  has_many :children, class_name: 'Post', foreign_key: :parent_id, dependent: :destroy

  belongs_to :topic
  belongs_to :user
  # いいね機能
  has_many :likes, as: :liked_content, dependent: :destroy

  # has_many :professional_likes, -> { where 'category = 1' }, as: :liked_content, class_name: 'Like', dependent: :destroy
  # has_many :scientifically_likes, -> { where 'category = 2' }, as: :liked_content, class_name: 'Like', dependent: :destroy
  # has_many :logical_likes, -> { where 'category = 3' }, as: :liked_content, class_name: 'Like', dependent: :destroy
  # has_many :dislikes, -> { where 'category = 4' }, as: :liked_content, class_name: 'Like', dependent: :destroy
  has_many :normal_likes, -> { where 'category = 11' }, as: :liked_content, class_name: 'Like', dependent: :destroy

  has_many :word_evaluations, dependent: :destroy

  # def professional_liked_by?(user)
  #   likes.where(user_id: user.id, category: 1).exists?
  # end

  # def scientifically_liked_by?(user)
  #   likes.where(user_id: user.id, category: 2).exists?
  # end

  # def logical_liked_by?(user)
  #   likes.where(user_id: user.id, category: 3).exists?
  # end

  # def disliked_by?(user)
  #   likes.where(user_id: user.id, category: 4).exists?
  # end

  def normal_liked_by?(user)
    likes.where(user_id: user.id, category: 11).exists?
  end

  scope :answered, -> { where(answer: true) }
  scope :not_answerd, -> { where(answer: false) }
end
