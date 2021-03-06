class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  attachment :background

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comment_favorites, dependent: :destroy
  has_many :artists, dependent: :destroy
  has_many :replay_comments, dependent: :destroy
  has_many :contacts, dependent: :destroy

  enum sex: {男: 0, 女: 1}

  #チャット機能
  has_many :user_rooms
  has_many :chats

  #フォロー機能
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :follower_user, through: :follower, source: :following
  has_many :following_user, through: :following, source: :follower

  #フォローする
  def follow(user_id)
    following.create(follower_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    following.find_by(follower_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  #退会ユーザー確認
  #is_deletedがfalseならばtrueを返す
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  validates :nickname, presence: true
  validates :post_code, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :birthday, presence: true
end
