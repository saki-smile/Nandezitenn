class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image

  validates :title, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
