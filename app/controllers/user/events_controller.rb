class User::EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
		@post = Post.new
		@post.images.build
	end

end
