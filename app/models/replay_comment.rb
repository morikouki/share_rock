class ReplayComment < ApplicationRecord

	belongs_to :user
	belongs_to :post
	belongs_to :event
	belongs_to :post_comment

	validates :comment, presence: true
end
