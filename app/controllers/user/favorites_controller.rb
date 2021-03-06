class User::FavoritesController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@event = Event.find(params[:event_id])
		favorite = current_user.favorites.new(post_id: @post.id)
		favorite.save
	end

	def destroy
		@post = Post.find(params[:post_id])
		@event = Event.find(params[:event_id])
		favorite = current_user.favorites.find_by(post_id: @post.id)
		favorite.destroy
	end
end
