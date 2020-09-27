class User::PostCommentsController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
		comment = PostComment.new(post_comment_params)
		comment.user_id = current_user.id
		comment.event_id = @event.id
		comment.post_id = @post.id
		comment.save
	end

	def update
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
		comment = PostComment.find(params[:id])
		comment.update(post_comment_params)

	end

	def destroy
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
		comment = PostComment.find(params[:id])
		comment.user_id = current_user.id
		comment.event_id = @event.id
		comment.post_id = @post.id
		comment.delete
	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
