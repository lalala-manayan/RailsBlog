class Tag < ApplicationRecord
  # TagはPostをたくさん持っている
  has_many :post_tags
  # TagはPostをPostTag中間テーブルを介してたくさん持っている
  has_many :posts, through: :post_tags, dependent: :destroy
  validates :name, length: {maximum: 15}, presence: true, uniqueness: true #追加
  validates :color, presence: true #追加
end
