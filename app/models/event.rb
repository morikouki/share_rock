class Event < ApplicationRecord
	
	attachment :image

	has_many :posts, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :replay_comments, dependent: :destroy

	validates :prefecture_code, presence: true
	validates :city, presence: true
	validates :official_link, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :title, presence: true
	validates :explanation, presence: true

end
