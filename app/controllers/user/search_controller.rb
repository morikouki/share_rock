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
		@search = Event.where(prefecture_code: "北海道")
	end

	def kanto
		@search = Event.where(prefecture_code: "東京都")
		@search += Event.where(prefecture_code: "千葉県")
		@search += Event.where(prefecture_code: "埼玉県")
		@search += Event.where(prefecture_code: "茨城県")
		@search += Event.where(prefecture_code: "栃木県")
		@search += Event.where(prefecture_code: "神奈川県")
		@search += Event.where(prefecture_code: "群馬県")
	end

	def tohoku
		@search = Event.where(prefecture_code: "青森県")
		@search += Event.where(prefecture_code: "岩手県")
		@search += Event.where(prefecture_code: "秋田県")
		@search += Event.where(prefecture_code: "福島県")
		@search += Event.where(prefecture_code: "宮城県")
		@search += Event.where(prefecture_code: "山形県")
	end

	def chubu
		@search = Event.where(prefecture_code: "新潟県")
		@search += Event.where(prefecture_code: "長野県")
		@search += Event.where(prefecture_code: "山梨県")
		@search += Event.where(prefecture_code: "静岡県")
		@search += Event.where(prefecture_code: "富山県")
		@search += Event.where(prefecture_code: "石川県")
		@search += Event.where(prefecture_code: "福井県")
		@search += Event.where(prefecture_code: "岐阜県")
		@search += Event.where(prefecture_code: "愛知県")
	end

	def kinki
		@search = Event.where(prefecture_code: "京都府")
		@search += Event.where(prefecture_code: "滋賀県")
		@search += Event.where(prefecture_code: "三重県")
		@search += Event.where(prefecture_code: "奈良県")
		@search += Event.where(prefecture_code: "和歌山県")
		@search += Event.where(prefecture_code: "大阪府")
		@search += Event.where(prefecture_code: "兵庫県")
	end

	def chugoku_shikoku
		@search = Event.where(prefecture_code: "鳥取県")
		@search += Event.where(prefecture_code: "岡山県")
		@search += Event.where(prefecture_code: "島根県")
		@search += Event.where(prefecture_code: "広島県")
		@search += Event.where(prefecture_code: "山口県")
		@search += Event.where(prefecture_code: "香川県")
		@search += Event.where(prefecture_code: "愛媛県")
		@search += Event.where(prefecture_code: "徳島県")
		@search += Event.where(prefecture_code: "高知県")
	end

	def kyusyu_okinawa
		@search = Event.where(prefecture_code: "福岡県")
		@search += Event.where(prefecture_code: "佐賀県")
		@search += Event.where(prefecture_code: "岡山県")
		@search += Event.where(prefecture_code: "宮崎県")
		@search += Event.where(prefecture_code: "熊本県")
		@search += Event.where(prefecture_code: "長崎県")
		@search += Event.where(prefecture_code: "鹿児島県")
		@search += Event.where(prefecture_code: "沖縄")
	end


end













