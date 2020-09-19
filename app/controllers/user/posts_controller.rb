class User::PostsController < ApplicationController

	def create
		event = Event.find(params[:event_id])
		post = current_user.posts.new(post_params)
		post.event_id = event.id
		post.save
		redirect_to user_event_path(event)
	end

	def show
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		@comment = PostComment.new
	end

	private

	def post_params
		params.require(:post).permit(:post_image, :post_title, :post_text)
	end
end
