class User::EventsController < ApplicationController

	def index
		day = Date.start_date
		day.year
		case params[:year]
		when '0'
			@events = Event.where(day: 2020)
		when '1'
			@events = Event.where(day: 2019)
		when '2'
			@events = Event.where(start_date: '2018')
		when '3'
			@events = Event.where(start_date: '2017')
		else
		    @events = Event.all
		end
	end

	def show
		@event = Event.find(params[:id])
		@post = Post.new
		@post.post_images.build
	end

end
