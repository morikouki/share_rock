class EventsController < ApplicationController

	def index
	end

	def show
	end

	def create
	end

	def edit
	end

	def update
	end

	private

	def event_params
		params.require(:event).permit(:image, :title, :explanation, :prefectures, :address_city, :event_date)
	end
end
