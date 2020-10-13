class PostComment < ApplicationRecord

	belongs_to :user
	belongs_to :post
	belongs_to :event
	has_many :comment_favorites, dependent: :destroy
	has_many :replay_comments, dependent: :destroy

	#コメントに既にいいねしているか確認
	def comment_favorited_by?(user)
    	comment_favorites.where(user_id: user.id).exists?
  	end

  	validates :comment, presence: true
end
