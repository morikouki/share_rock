class User::UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_user_path(@user)

	end


	private

	def user_params
		params.require(:user).permit(:profile_image, :introduction, :background)
	end
end
