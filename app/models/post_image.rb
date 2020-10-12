class PostImage < ApplicationRecord

	belongs_to :post

	attachment :image

	validates :image_id, presence: true
end
