class User::CommentFavoritesController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	def create
		@post_comment = PostComment.find(params[:post_comment_id])
		@post = Post.find(params[:post_id])
		@event = Event.find(params[:event_id])
		comment_favorite = current_user.comment_favorites.new(post_comment_id: @post_comment.id, post_id: @post.id)
		comment_favorite.save
	end

	def destroy
		@post_comment = PostComment.find(params[:post_comment_id])
		@post = Post.find(params[:post_id])
		@event = Event.find(params[:event_id])
		comment_favorite = current_user.comment_favorites.find_by(post_comment_id: @post_comment.id, post_id: @post.id)
		comment_favorite.destroy
	end
end
