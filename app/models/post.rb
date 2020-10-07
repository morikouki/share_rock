class Post < ApplicationRecord

	belongs_to :user
	belongs_to :event
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :comment_favorites, dependent: :destroy
	has_many :post_images, dependent: :destroy
	has_many :replay_comments, dependent: :destroy
    accepts_nested_attributes_for :post_images, allow_destroy: true
    has_many :tag_middles, dependent: :destroy
  	has_many :tags, through: :tag_middlles

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end

  	def save_tag(sent_tags)
	    current_tags = self.tags.pluck(:name) unless self.tags.nil?
	    old_tags = current_tags - sent_tags
	    new_tags = sent_tags - current_tags
	　
	    old_tags.each do |old|
	      self.post_tags.delete PostTag.find_by(name: old)
	    end
	　
	    new_tags.each do |new|
	      new_post_tag = PostTag.find_or_create_by(name: new)
	      self.post_tags << new_post_tag
	    end
	  end
end
