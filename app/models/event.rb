class Event < ApplicationRecord
	
	attachment :image

	has_many :posts, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :replay_comments, dependent: :destroy

end
