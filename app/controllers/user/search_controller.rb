class User::SearchController < ApplicationController

	#ログイン済ユーザーのみ
	before_action :authenticate_user!

	def search
		@search = Event.ransack(params[:q])
	end

	def index #キーワード検索のイベント取得
		@search = Event.ransack(params[:q])
		@events = @search.result(distinct: true).page(params[:page]).per(6).order("id DESC")
	end

	def hokkaido #JapanMapの北海道地方
		@events = Event.where(prefecture_code: "北海道")
		@events = @events.page(params[:page]).per(6).order("id DESC")
	end

	def kanto #JapanMapの関東地方
		@events = Event.where(prefecture_code: ["東京都", "千葉県", "埼玉県", "茨城県", "栃木県", "神奈川県", "群馬県"])
		@events = @events.page(params[:page]).per(6).order("id DESC")
	end

	def tohoku #JapanMapの東北地方
		@events = Event.where(prefecture_code: ["青森県", "岩手県", "秋田県", "福島県", "宮城県", "山形県"])
		@events = @events.page(params[:page]).per(6).order("id DESC")
	end

	def chubu #JapanMapの中部地方
		@events = Event.where(prefecture_code: ["新潟県", "長野県", "山梨県", "静岡県", "富山県", "石川県", "福井県", "岐阜県", "愛知県"])
		@events = @events.page(params[:page]).per(6).order("id DESC")
	end

	def kinki #JapanMapの近畿地方
		@events = Event.where(prefecture_code: ["京都府", "滋賀県", "三重県", "奈良県", "和歌山県", "大阪府", "兵庫県"])
		@events = @events.page(params[:page]).per(6).order("id DESC")
	end

	def chugoku_shikoku #JapanMapの中国・四国地方
		@events = Event.where(prefecture_code: ["鳥取県", "岡山県", "島根県", "広島県", "山口県", "香川県", "愛媛県", "徳島県", "高知県"])
		@events = @events.page(params[:page]).per(6).order("id DESC")
	end

	def kyusyu_okinawa #JapanMapの九州・沖縄地方
		@events = Event.where(prefecture_code: ["福岡県", "佐賀県", "岡山県", "宮崎県", "熊本県", "長崎県", "鹿児島県", "沖縄"])
		@events = @events.page(params[:page]).per(6).order("id DESC")
	end


end













