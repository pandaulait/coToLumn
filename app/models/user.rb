class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :columns, dependent: :destroy
  has_many :patches, dependent: :destroy
  has_many :problems, as: :author, dependent: :destroy
  has_many :comments, as: :speaker, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest"
    end
  end
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
