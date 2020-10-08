class User::UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@artist_new = Artist.new
		@posts = @user.posts
		@posts = @posts.page(params[:page]).per(3).order("id DESC")
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_user_path(@user)
	end

	def confirm
	end

	def withdraw
		if current_user.update(is_deleted: true)
			reset_session
			redirect_to root_path, notice: "ありがとうございました。またのご利用をお待ちしております。"
		end
	end

	private

	def user_params
		params.require(:user).permit(:profile_image, :introduction, :background)
	end

end
