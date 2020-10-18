class EventsController < ApplicationController

	#管理者のみ
	before_action :authenticate_admin!

	def index
		@event = Event.new
		@events = Event.all.page(params[:page]).per(6).order("id DESC")
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			tags = Vision.get_image_data(list.image)    
    		tags.each do |tag|
      			list.tags.create(name: tag)
    		end
			redirect_to events_path
		else
			flash[:error] = 'イベントを登録できませんでした。全ての項目を入力してください。'
			redirect_to events_path
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			redirect_to events_path
		else
			flash[:error] = 'イベントを登録できませんでした。全ての項目を入力してください。'
			redirect_to events_path
		end
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
