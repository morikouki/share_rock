class Image < ApplicationRecord

	belongs_to :post, optional: true
	attachment :image
end
