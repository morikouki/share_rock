class User::UsersController < ApplicationController

	def my_page
	end

	private

	def user_params
		params.require(:user).permit(:profile_image)
	end
end
