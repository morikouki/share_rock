class User::ArtistsController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	#アクションの前にログインユーザーか確認
	before_action :ensure_correct_user, only: [:destroy]

	def index
		@artist = Artist.find(params[:artist_id])

		#ログインユーザー以外を取得
		artists = Artist.all.where.not(user_id: current_user)

		#好きなアーティストが同じユーザーを探す
		@artists = artists.where("like_artist LIKE?", "%#{@artist.like_artist}%")
	end

	def create
		@user = User.find(params[:user_id])
		artist = @user.artists.new(artist_params)
		@artist_new = Artist.new
		if artist.save
		else
			flash[:error] = "アーティストを登録できませんでした。登録し直してください。"
			redirect_to user_user_path(current_user)
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		artist = Artist.find(params[:id])
		artist.destroy
	end

	private

	def artist_params
		params.require(:artist).permit(:like_artist)
	end

	def ensure_correct_user
	    @user = User.find(params[:user_id])
	    if @user != current_user
	      redirect_to user_user_path(current_user)
	    end
	end

end
