class Post < ApplicationRecord
  validates :title, length: { in: 1..20 }
  validates :brief, length: { in: 1..30 }

  has_many :post_tags
  # PostはTagをPostTag中間テーブルを介してたくさん持っている
  has_many :tags, through: :post_tags, dependent: :destroy
  belongs_to :user
  mount_uploader :image, ImagesUploader
  has_many :likes #追加
  has_many :liked_users, through: :likes, source: :user #追加
  has_many :comments #追加
  has_many :commented_users, through: :comments, source: :user
end