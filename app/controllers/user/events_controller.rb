class User::EventsController < ApplicationController

	def index
		
		case params[:year]
		when '2020年'
			@events = Event.where("start_date LIKE?", "%2020%")
		when '2019年'
			@events = Event.where("start_date LIKE?", "%2019%")
		when '2018年'
			@events = Event.where("start_date LIKE?", "%2018%")
		when '2017年'
			@events = Event.where("start_date LIKE?", "%2017%")
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
