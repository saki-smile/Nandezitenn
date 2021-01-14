class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # お気に入りの投稿
  has_many :favorite_questions, through: :favorites, source: :question
  # フォロー取得
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロワー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローしている人
  has_many :following_user, through: :follower, source: :followed
  # 自分をフォローしている人
  has_many :follower_user, through: :followed, source: :follower

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end
  def active_for_authentication?
    super && (self.is_active === false)
  end
end
