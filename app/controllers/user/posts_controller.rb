class User::PostsController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		post = @event.posts.new(post_params)
		post.event_id = @event.id
		post.save
		@posts = Post.all
		redirect_to user_event_path(@event)
	end

	private

	def post_params
		params.require(:post).permit(:post_image, :post_text)
	end
end
