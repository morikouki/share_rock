class User::PostsController < ApplicationController

	def create
		event = Event.find(params[:event_id])
		tag_list = params[:post][:name].split(",")
		post = current_user.posts.new(post_params)
		post.event_id = event.id
		post.save
		post.save_tag(tag_list)
		params[:post_images][:image].each do |image|
            post.post_images.create(image: image, post_id: post.id)
        end
		redirect_to user_event_path(event)
	end

	def show
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		@comment = PostComment.new
		@replay_comment = ReplayComment.new
		@tags = @post.tags
	end

	def edit
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
	end

	def update
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to user_user_path(current_user)
	end

	def destroy
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:id])
		@post.event_id = @event.id
		@post.post_images.destroy_all
		@post.destroy
		redirect_to user_user_path(current_user)
	end

	private

	def post_params
		params.require(:post).permit(:post_title, :post_text, post_images_attributes: [:id, :image])
	end
end
