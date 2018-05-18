class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: {maximum: 150}

  scope :desc, -> {order(created_at: :desc)}
end
