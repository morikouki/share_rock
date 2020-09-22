class User::PostsController < ApplicationController

	def create
		event = Event.find(params[:event_id])
		post = current_user.posts.new(post_params)
		post.event_id = event.id
		post.save
		params[:post_images][:image].each do |image|
            post.post_images.create(image: image, post_id: post.id)
          end
		redirect_to user_event_path(event)
	end

	def show
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		@comment = PostComment.new
	end

	private

	def post_params
		params.require(:post).permit(:post_title, :post_text, post_images_attributes: [:image])
	end
end
