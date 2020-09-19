class Event < ApplicationRecord
	
	attachment :image

	has_many :posts, dependent: :destroy
end
