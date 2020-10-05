class User::PostCommentsController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
		post_comment = PostComment.new(post_comment_params)
		post_comment.user_id = current_user.id
		post_comment.event_id = @event.id
		post_comment.post_id = @post.id
		post_comment.save
	end

	def update
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
		post_comment = PostComment.find(params[:id])
		post_comment.update(post_comment_params)

	end

	def destroy
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
		post_comment = PostComment.find(params[:id])
		post_comment.user_id = current_user.id
		post_comment.event_id = @event.id
		post_comment.post_id = @post.id
		post_comment.destroy
	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
