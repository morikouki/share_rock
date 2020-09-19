class Post < ApplicationRecord

	belongs_to :user
	belongs_to :event
	attachment :post_image
end
