class User::RelationshipsController < ApplicationController

	def create
		 current_user.follow(params[:user_id])
    	redirect_to request.referer
	end

	def destroy
		 current_user.unfollow(params[:user_id])
    	redirect_to request.referer
	end

	def follower
		user = User.find(params[:user_id])
		@follower = user.follower_user
	end

	def following
		user = User.find(params[:user_id])
		@following = user.following_user
	end
end
