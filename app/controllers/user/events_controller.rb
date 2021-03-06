class User::EventsController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	def index
		#イベント開催年での検索
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
		@events = @events.page(params[:page]).per(6).order("id DESC")
	end

	def show
		@event = Event.find(params[:id])
		@post = Post.new
		@post.post_images.build
		@posts = @event.posts
		@posts = @posts.page(params[:page]).per(3).order("id DESC")
  	end

end
