class Artist < ApplicationRecord

	belongs_to :user

	validates :like_artist, presence: true
end
