class User::CommentFavoritesController < ApplicationController

	def create
		@post_comment = PostComment.find(params[:post_comment_id])
		post = Post.find(params[:post_id])
		comment_favorite = current_user.comment_favorites.new(params[post_comment_id: @post_comment.id])
		comment_favorite.post_id = post.id
		comment_favorite.post_comment_id = @post_comment.id
		comment_favorite.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@post_comment = PostComment.find(params[:post_comment_id])
		post = Post.find(params[:post_id])
		comment_favorite = current_user.comment_favorites.find_by(params[post_comment_id: @post_comment.id])
		comment_favorite.post_id = post.id
		comment_favorite.post_comment_id = @post_comment.id
		comment_favorite.destroy
		redirect_back(fallback_location: root_path)
	end
end
