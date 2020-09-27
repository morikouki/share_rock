class User::ArtistsController < ApplicationController

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def artist_params
		params.require(:artist).permit(:like_artist)
	end

end
