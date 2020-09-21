class User::SearchController < ApplicationController

	def search
		@search = Event.ransack(params[:q])
		@events = @search.result(distinct: true)
	end

	def index
		@search = Event.ransack(params[:q])
		@events = @search.result(distinct: true)
	end
end
