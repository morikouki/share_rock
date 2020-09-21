class User::SearchController < ApplicationController

	def search
		@search = Event.ransack(params[:q])
		@events = @search.result(distinct: true)
	end

	def index
		@search = Event.ransack(params[:q])
		@events = @search.result(distinct: true)
	end

	def hokkaido
		@search = Event.where(prefectures: "北海道")
	end

	def kanto
		@search = Event.where(prefectures: "東京都")
		@search += Event.where(prefectures: "千葉県")
		@search += Event.where(prefectures: "埼玉県")
		@search += Event.where(prefectures: "茨城県")
		@search += Event.where(prefectures: "栃木県")
		@search += Event.where(prefectures: "神奈川県")
		@search += Event.where(prefectures: "群馬県")
	end

	def tohoku
		@search = Event.where(prefectures: "青森県")
		@search += Event.where(prefectures: "岩手県")
		@search += Event.where(prefectures: "秋田県")
		@search += Event.where(prefectures: "福島県")
		@search += Event.where(prefectures: "宮城県")
		@search += Event.where(prefectures: "山形県")
	end

	def chubu
		@search = Event.where(prefectures: "新潟県")
		@search += Event.where(prefectures: "長野県")
		@search += Event.where(prefectures: "山梨県")
		@search += Event.where(prefectures: "静岡県")
		@search += Event.where(prefectures: "富山県")
		@search += Event.where(prefectures: "石川県")
		@search += Event.where(prefectures: "福井県")
		@search += Event.where(prefectures: "岐阜県")
		@search += Event.where(prefectures: "愛知県")
	end

	def kinki
		@search = Event.where(prefectures: "京都府")
		@search += Event.where(prefectures: "滋賀県")
		@search += Event.where(prefectures: "三重県")
		@search += Event.where(prefectures: "奈良県")
		@search += Event.where(prefectures: "和歌山県")
		@search += Event.where(prefectures: "大阪府")
		@search += Event.where(prefectures: "兵庫県")
	end

	def chugoku_shikoku
		@search = Event.where(prefectures: "鳥取県")
		@search += Event.where(prefectures: "岡山県")
		@search += Event.where(prefectures: "島根県")
		@search += Event.where(prefectures: "広島県")
		@search += Event.where(prefectures: "山口県")
		@search += Event.where(prefectures: "香川県")
		@search += Event.where(prefectures: "愛媛県")
		@search += Event.where(prefectures: "徳島県")
		@search += Event.where(prefectures: "高知県")
	end

	def kyusyu_okinawa
		@search = Event.where(prefectures: "福岡県")
		@search += Event.where(prefectures: "佐賀県")
		@search += Event.where(prefectures: "岡山県")
		@search += Event.where(prefectures: "宮崎県")
		@search += Event.where(prefectures: "熊本県")
		@search += Event.where(prefectures: "長崎県")
		@search += Event.where(prefectures: "鹿児島県")
		@search += Event.where(prefectures: "沖縄")
	end


end













