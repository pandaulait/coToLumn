class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :texts, dependent: :destroy
  has_many :problems, as: :author, dependent: :destroy
  has_many :comments, as: :speaker, dependent: :destroy
  has_many :activities, as: :receiver, dependent: :destroy
end
