class CommentFavorite < ApplicationRecord

	belongs_to :user
	belongs_to :post_comment, optional: true
	belongs_to :post, optional: true
end
