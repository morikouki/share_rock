class User::ReplayCommentsController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
		@post_comment = PostComment.find(params[:post_comment_id])
		replay_comment = ReplayComment.new(replay_comment_params)
		replay_comment.user_id = current_user.id
		replay_comment.event_id = @event.id
		replay_comment.post_id = @post.id
		replay_comment.post_comment_id = @post_comment.id
		replay_comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@event = Event.find(params[:event_id])
		@post = Post.find(params[:post_id])
		@post_comment = PostComment.find(params[:post_comment_id])
		replay_comment = ReplayComment.find(params[:id])
		replay_comment.user_id = current_user.id
		replay_comment.event_id = @event.id
		replay_comment.post_id = @post.id
		replay_comment.post_comment_id = @post_comment.id
		replay_comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def replay_comment_params
		params.require(:replay_comment).permit(:comment)
	end
end
