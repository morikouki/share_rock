class EventsController < ApplicationController

	def index
		@event = Event.new
		@events = Event.all
	end

	def show
	end

	def create
		@event = Event.new(event_params)
		@event.save
		redirect_to events_path
	end

	def edit
	end

	def update
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end


	private

	def event_params
		params.require(:event).permit(:image, :title, :explanation, :prefecture_code, :city, :start_date, :end_date, :official_link)
	end
end
