class User::UsersController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	#アクションの前にログインユーザーか確認
	before_action :ensure_correct_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
		@artist_new = Artist.new
		@posts = @user.posts
		@posts = @posts.page(params[:page]).per(3).order("id DESC")
		@contact = Contact.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_user_path(@user)
		else
			flash[:error] = "編集できませんでした。必須項目を記入してください。"
			redirect_to edit_user_user_path(@user)
		end
	end

	#退会確認画面
	def confirm
	end

	#ユーザーの退会処理
	def withdraw
		@user = current_user

		#is_deletedカラムをtrueに更新（デフォルトはfalseで会員）
		if @user.update(is_deleted: true)
			reset_session
			redirect_to root_path, notice: "ありがとうございました。またのご利用をお待ちしております。"
		end
	end

	private

	def user_params
		params.require(:user).permit(:nickname, :birthday, :prefecture_code, :address_city, :sex, :profile_image, :introduction, :background)
	end

	#ログインユーザーか確認、ログインユーザーでなかったらマイページへ
	def ensure_correct_user
	    @user = User.find(params[:id])
	    if @user != current_user
	      redirect_to user_user_path(current_user)
	    end
	end

end
