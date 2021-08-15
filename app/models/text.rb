class Text < ApplicationRecord
  belongs_to :admin
  attachment :image
  has_many :links, dependent: :destroy
  has_many :patches, dependent: :destroy
  has_many :literatures , as: :subject, dependent: :destroy

  has_many :subjects, -> { where "kind = 1" }
  has_many :problems ,through: :subjects

  has_many :mathmatical_subjects, -> { where "kind = 1" }, class_name: "Subject"
  has_many :mathmatical_problems, :through => :mathmatical_subjects, :source => "problem"

  has_many :japanese_subjects, -> { where "kind = 2" }, class_name: "Subject"
  has_many :japanese_problems, :through => :japanese_subjects, :source => "problem"

  # has_many :japanese_subjects, -> { where "subject = 0" }, class_name: "Subjects"
  # has_many :japanese_problems, class_name: "Problems" , through: :japanese_subjects

  has_many :comments, as: :article, dependent: :destroy
end
