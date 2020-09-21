class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comment_favorites, dependent: :destroy

  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :follower_user, througth: :following, source: :follower
  has_many :following_user, througth: :follower, source: :following

  def follow(user_id)
    follower.create(following_id: user_id)
  end
  
  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(following_id: user_id).destroy
  end
  
  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  enum sex: {男: 0, 女: 1}

  attachment :profile_image
  attachment :background
end
