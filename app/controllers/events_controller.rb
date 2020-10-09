class EventsController < ApplicationController

	#管理者のみ
	before_action :authenticate_admin!

	def index
		@event = Event.new
		@events = Event.all.page(params[:page]).per(6).order("id DESC")
	end

	def create
		@event = Event.new(event_params)
		@event.save
		redirect_to events_path
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		redirect_to events_path
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
