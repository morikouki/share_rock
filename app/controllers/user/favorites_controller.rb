class User::FavoritesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.new(post_id: @post.id)
		favorite.save
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
	end

	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.find_by(post_id: @post.id)
		favorite.destroy
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
	end
end
