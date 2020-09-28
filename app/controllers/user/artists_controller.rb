class User::ArtistsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		artist = @user.artists.new(artist_params)
		@artist_new = Artist.new
		artist.save
	end

	def edit
	end

	def update
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

end
