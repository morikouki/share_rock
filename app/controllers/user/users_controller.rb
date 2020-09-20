class User::UsersController < ApplicationController

	def my_page
	end

	def edit

	end

	def update
		current_user.update(user_params)
		redirect_to my_page_user_users_path

	end


	private

	def user_params
		params.require(:user).permit(:profile_image, :introduction, :background)
	end
end
