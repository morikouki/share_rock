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
  	has_many :tags, through: :tag_middles, dependent: :destroy

  	#いいねしているか確認
	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end

  	#タグ保存
  	def save_tag(tags)

  		#タグが既にあるか確認
	    current_tags = self.tags.pluck(:name) unless self.tags.nil?
	    old_tags = current_tags - tags
	    new_tags = tags - current_tags

	    #古いタグを消す
	    old_tags.each do |old_name|
	      self.tags.delete Tag.find_by(name: old_name)
	    end

	    #新しいタグを保存
	    new_tags.each do |new_name|
	      post_tag = Tag.find_or_create_by(name: new_name)
	      self.tags << post_tag
	    end
	end

	validates :post_title, presence: true
	validates :post_text, presence: true

end
