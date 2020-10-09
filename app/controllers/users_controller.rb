class UsersController < ApplicationController

	#管理者のみ
	before_action :authenticate_admin!

	def index
		@users = User.all
	end
end
