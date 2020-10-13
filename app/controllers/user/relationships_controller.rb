class User::RelationshipsController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	def create
		current_user.follow(params[:user_id])
    	redirect_back(fallback_location: root_path)
	end

	def destroy
		current_user.unfollow(params[:user_id])
    	redirect_back(fallback_location: root_path)
	end
end
