class Post < ApplicationRecord

	belongs_to :user
	belongs_to :event
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :comment_favorites, dependent: :destroy
	has_many :post_images, dependent: :destroy
	has_many :replay_comments, dependent: :destroy
    accepts_nested_attributes_for :post_images, allow_destroy: true

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end
end
