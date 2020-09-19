class Post < ApplicationRecord

	belongs_to :user
	belongs_to :event
	has_many :post_comment, dependent: :destroy
	attachment :post_image
end
