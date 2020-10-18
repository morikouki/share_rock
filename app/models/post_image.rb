class PostImage < ApplicationRecord

	belongs_to :post
	has_many :vision_tags, dependent: :destroy

	attachment :image

end
