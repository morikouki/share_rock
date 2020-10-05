class User::ReplayCommentsController < ApplicationController

	def create
	end

	def destroy
	end

	private
	def replay_comment_params
		params.require(:replay_comment).permit(:comment)
	end
end
