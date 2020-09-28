class Event < ApplicationRecord
	
	attachment :image

	has_many :posts, dependent: :destroy
	has_many :post_comments, dependent: :destroy

	
	def address
	    [prefecture_code, city].join
    end
end
