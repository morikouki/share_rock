class User::SearchController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	def search
		@search = Event.ransack(params[:q])
	end

	def index
		if params[:sort] == 'hokkaido'
			@events = Event.where(prefecture_code: "北海道")
			@events = @events.page(params[:page]).per(6).order("id DESC")

		elsif params[:sort] == 'tohoku'
			@events = Event.where(prefecture_code: ["青森県", "岩手県", "秋田県", "福島県", "宮城県", "山形県"])
			@events = @events.page(params[:page]).per(6).order("id DESC")

		elsif params[:sort] == 'kanto'
			@events = Event.where(prefecture_code: ["東京都", "千葉県", "埼玉県", "茨城県", "栃木県", "神奈川県", "群馬県"])
			@events = @events.page(params[:page]).per(6).order("id DESC")

		elsif params[:sort] == 'chubu'
			@events = Event.where(prefecture_code: ["新潟県", "長野県", "山梨県", "静岡県", "富山県", "石川県", "福井県", "岐阜県", "愛知県"])
			@events = @events.page(params[:page]).per(6).order("id DESC")

		elsif params[:sort] == 'kinki'
			@events = Event.where(prefecture_code: ["京都府", "滋賀県", "三重県", "奈良県", "和歌山県", "大阪府", "兵庫県"])
			@events = @events.page(params[:page]).per(6).order("id DESC")

		elsif params[:sort] == 'chugoku_shikoku'
			@events = Event.where(prefecture_code: ["鳥取県", "岡山県", "島根県", "広島県", "山口県", "香川県", "愛媛県", "徳島県", "高知県"])
			@events = @events.page(params[:page]).per(6).order("id DESC")

		elsif params[:sort] == 'kyusyu_okinawa'
			@events = Event.where(prefecture_code: ["福岡県", "佐賀県", "岡山県", "宮崎県", "熊本県", "長崎県", "鹿児島県", "沖縄"])
			@events = @events.page(params[:page]).per(6).order("id DESC")

		#キーワード検索でイベント取得
		else
			@search = Event.ransack(params[:q])
			@events = @search.result(distinct: true).page(params[:page]).per(6).order("id DESC")
		end
	end

end













