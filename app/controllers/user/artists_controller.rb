class User::ArtistsController < ApplicationController

	def create
		artist = current_user.artists.new(artist_params)
		artist.save
		redirect_to user_user_path(current_user)
	end

	def edit
	end

	def update
	end

	def destroy
		artist = current_user.artists.find_by(params[:user_id])
		artist.destroy
		redirect_to user_user_path(current_user)
	end

	private

	def artist_params
		params.require(:artist).permit(:like_artist)
	end

end
